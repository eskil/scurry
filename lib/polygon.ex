defmodule Scurry.Polygon do
  @moduledoc """
  Functions related to polygons and lines relevant for 2D map pathfinding.

  This provides functions for;

  * line of sight between two points
  * classify polygon vertices as concave or vertex
  * intersections of lines and polygons
  * checking if points are inside/outside polygons
  * finding nearest point on a polygon and distances

  Polygons are
  * A list of vertices, `[{x1, y1}, {x2,y2}, ...]`.
  * They must not be closed, ie. last vertex should not be equal to the first.
  * They must be in clockwise order in screen coordinates, otherwise
    convex/concave classification will be inversed as it traverses the egdes.

  > ### Order of vertices {: .warning}
  >
  > They must be in clockwise order in screen coordinates, otherwise
  > convex/concave classification will be inversed as it traverses the egdes.
  >
  > Here's a crude drawing of an example of the M shaped polygon used for many tests/docs.
  >
  > `polygon = [{0, 0}, {10, 0}, {20, 0}, {20, 20}, {10, 10}, {0, 20}]`
  > ![Order of vertices](imgs/polygon.png)
  """

  alias Scurry.Geo
  use Scurry.Types

  @doc """
  Checks if a line intersects a polygon.

  This is a bare-minimum function, and for most cases using `intersections/2`
  will be a better choice.

  ## Params
  * `polygon` a list of points (`[{x, y}, {x, y}, ...]`) describing a polygon.
  * `line` a tuple of points (`{{ax, ay}, {bx, by}}`) describing a line.

  Returns `true` or `false` wether the line intersects the polygon or not.
  """
  def intersects?(polygon, line) do
    prev_point = List.last(polygon)
    intersects_helper(polygon, line, prev_point)
  end

  @doc """
  Get all intersections of a line with a polygon including their type.

  This function basically calls `Geo.line_segment_intersection/2` for every segment
  of the `polygon` against the `line` and filters the results to only include
  the list of intersection points.

  ## Params
  * `polygon` a list of points (`[{x, y}, {x, y}, ...]`) describing a
    polygon. This must be non-closed.
  * `line` a tuple of points (`{{ax, ay}, {bx, by}}`) describing a line.
  * `opts`
    * `:allow_points` (default `false`) whether a `on_point` intersection
      should be considered an intersection or not. This varies from use
      cases. Eg. when building a polygon, points will be connected and thus
      intersect if `true`. This may not be the desired result, so `false` won't
      consider points intersections.

  Returns a list of `{x, y}` tuples indicating where the line intersects, or
  `[]` if there's no intersections.

  ## Examples
      iex> polygon = [{0, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}]
      [{0, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}]
      iex> line = {{1, -1}, {1, 3}}
      {{1, -1}, {1, 3}}
      iex> Polygon.intersections(polygon, line)
      [{1.0, 0.0}]
      iex> Polygon.intersections(polygon, line, allow_points: true)
      [{1.0, 0.0}, {1.0, 0.5}]
  """
  def intersections(polygon, line, opts \\ []) do
    allow_points = Keyword.get(opts, :allow_points, false)
    prev_point = List.last(polygon)

    intersects_helper(polygon, line, prev_point, [])
    |> Enum.filter(fn
      {:intersection, _} -> true
      {:point_intersection, _} -> allow_points
      _ -> false
    end)
    |> Enum.map(fn {_, point} -> point end)
    |> Enum.dedup()
  end

  @doc """
  Get first intersections of a line with a polygon.

  The "opposite" of `last_intersection/2`.

  ## Params
  * `polygon` a list of points (`[{x, y}, {x, y}, ...]`) describing a polygon.
  * `line` a tuple of points (`{{ax, ay}, {bx, by}}`) describing a line. The
    first tuple (`{ax, ay}`) is considered the head of the line and "first" in
    this context means nearest to that point.

  Returns a `{x, y}` tuples indicating where the line first intersects, or `nil`
  if there's no intersection.
  """
  def first_intersection(polygon, {a, _b} = line) do
    Enum.min_by(
      intersections(polygon, line),
      fn ip ->
        Vector.distance(a, ip)
      end,
      fn ->
        nil
      end
    )
  end

  @doc """
  Get last intersections of a line with a polygon.

  The "opposite" of `first_intersection/2`.

  ## Params
  * `polygon` a list of points (`[{x, y}, {x, y}, ...]`) describing a polygon.
  * `line` a tuple of points (`{{ax, ay}, {bx, by}}`) describing a line. The
     second tuple (`{bx, by}`) is considered the end of the line and "last" in
     this context means nearest to that point.

  Returns a `{x, y}` tuples indicating where the line last intersects, or nil
  if there's no intersection.
  """
  def last_intersection(polygon, {a, _b} = line) do
    Enum.max_by(
      intersections(polygon, line),
      fn ip ->
        Vector.distance(a, ip)
      end,
      fn ->
        nil
      end
    )
  end

  defp intersects_helper([], _line, _prev_point) do
    :nointersection
  end

  defp intersects_helper([next_point | polygon], line, prev_point) do
    case Geo.line_segment_intersection(line, {prev_point, next_point}) do
      :parallel -> intersects_helper(polygon, line, next_point)
      :none -> intersects_helper(polygon, line, next_point)
      :on_segment -> :on_segment
      {:intersection, _} = result -> result
      {:point_intersection, _} = result -> result
    end
  end

  defp intersects_helper([], _line, _prev_point, acc) do
    acc
  end

  defp intersects_helper([next_point | polygon], line, prev_point, acc) when is_list(acc) do
    v = Geo.line_segment_intersection(line, {prev_point, next_point})
    intersects_helper(polygon, line, next_point, acc ++ [v])
  end

  @doc """
  Split a polygon into concave and convex vertices.

  When doing pathfinding, there will typically be a outer polygon bounding the
  "world" and multiple inner polygons describing "holes". The path can only be
  within the outer polygon and has to "walk around" the holes.

  Classifying the polygons into concave and convex gives the walkable graph.

  * The outer polygon's concave (pointing into the world) vertices should be
    used.
  * The holes' convex (point out of the hole, into the world) vertices should
    be used.

  In code, this looks like

  ```
  {concave, _convex} = Polygon.classify_vertices(world)

  convex = Enum.reduce(holes, [], fn points, acc ->
    {_, convex} = Polygon.classify_vertices(points)
    acc ++ convex
  end)

  vertices = concave ++ convex
  ```

  ## Params
  * `polygon`, a list of `{x, y}` tuples outlining a polygon. This must be non-closed.

  Returns `{list of concave vertices, list of convex}`.

  Three points that fall on the same line (`[{0, 0}, {1, 0}, {2, 0}]`) does not
  match neither the concave/convex definition (angle gt/lt 180 degrees) this
  will discard these via `classify_vertex/2`.

  ## Examples
      # A vaguely M shaped polygon
      iex> Polygon.classify_vertices([{0, 0}, {1, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}])
      {[{1, 0.5}], [{0, 0}, {2, 0}, {2, 1}, {0, 1}]}
  """
  def classify_vertices(polygon) do
    {concave, convex} =
      Enum.reduce(polygon, {0, []}, fn point, {idx, acc} ->
        {idx + 1, acc ++ [{point, classify_vertex(polygon, idx)}]}
      end)
      |> elem(1)
      |> Enum.reject(fn {_point, type} -> type == :neither end)
      |> Enum.split_with(fn {_point, type} -> type == :concave end)

    # Remove the type
    {Enum.map(concave, fn {p, _} -> p end), Enum.map(convex, fn {p, _} -> p end)}
  end

  @doc """
  Check if a vertex is concave, convex or neither.

  Whehter a vertex is concave or convex is defined by it pointing out - it's
  inner angle is less than 180 means convex and more than 180 means concave.

  When testing a vertex, keep this in mind and negate appropriately depending
  on whether it's the boundary polygon or a hole polygon being tested.

  ## Params
  * `polygon`, a list of `{x, y}` tuples outlining a polygon. This must be non-closed.
  * `at`, a position within `polygon` to check.

  Return
  * `:convex` for a convex vertice.
  * `:concave` for a concave vertice.
  * `:neither` for a vertice that's a straight edge, ie. 180 degrees.

  ## Examples
      # A vaguely M shaped polygon
      iex> Polygon.classify_vertex([{0, 0}, {1, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}], 0)
      :convex
      iex> Polygon.classify_vertex([{0, 0}, {1, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}], 1)
      :neither
      iex> Polygon.classify_vertex([{0, 0}, {1, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}], 4)
      :concave
  """
  # See https://www.david-gouveia.com/pathfinding-on-a-2d-polygonal-map
  def classify_vertex(polygon, at) do
    next = Enum.at(polygon, rem(at + 1, length(polygon)))
    current = Enum.at(polygon, at)
    prev = Enum.at(polygon, at - 1)

    left = Vector.sub(current, prev)
    right = Vector.sub(next, current)
    cross = Vector.cross(left, right)

    cond do
      cross < 0 -> :concave
      cross > 0 -> :convex
      true -> :neither
    end
  end

  @doc """
  Check if a vertex is concave or not.

  ## Params
  * `polygon`, a list of `{x, y}` tuples outlining a polygon. This must be non-closed.
  * `at`, a position within `polygon` to check.

  Return `true` or `false`.

  Three points that fall on the same line (`[{0, 0}, {1, 0}, {2, 0}]`) does not
  match neither the concave/convex definition (angle gt/lt 180 degrees). This
  will return false for such a vertex.

  ## Examples
      # A vaguely M shaped polygon
      iex> Polygon.is_concave?([{0, 0}, {1, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}], 0)
      false
      iex> Polygon.is_concave?([{0, 0}, {1, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}], 1)
      false
      iex> Polygon.is_concave?([{0, 0}, {1, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}], 2)
      false
      iex> Polygon.is_concave?([{0, 0}, {1, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}], 3)
      false
      iex> Polygon.is_concave?([{0, 0}, {1, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}], 4)
      true
      iex> Polygon.is_concave?([{0, 0}, {1, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}], 5)
      false
  """
  def is_concave?(polygon, at) do
    classify_vertex(polygon, at) == :concave
  end

  @doc """
  Check if a vertex is convex or not.

  ## Params
  * `polygon`, a list of `{x, y}` tuples outlining a polygon. This must be non-closed.
  * `at`, a position within `polygon` to check.

  Return `true` or `false`.

  Three points that fall on the same line (`[{0, 0}, {1, 0}, {2, 0}]`) does not
  match neither the concave/convex definition (angle gt/lt 180 degrees). This
  will return false for such a vertex.

  ## Examples
      # A vaguely M shaped polygon
      iex> Polygon.is_convex?([{0, 0}, {1, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}], 0)
      true
      iex> Polygon.is_convex?([{0, 0}, {1, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}], 1)
      false
      iex> Polygon.is_convex?([{0, 0}, {1, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}], 2)
      true
      iex> Polygon.is_convex?([{0, 0}, {1, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}], 3)
      true
      iex> Polygon.is_convex?([{0, 0}, {1, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}], 4)
      false
      iex> Polygon.is_convex?([{0, 0}, {1, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}], 5)
      true
  """
  def is_convex?(polygon, at) do
    classify_vertex(polygon, at) == :convex
  end

  # Alternate, https://sourceforge.net/p/polyclipping/code/HEAD/tree/trunk/cpp/clipper.cpp#l438
  @doc """
  Check if a point is inside a polygon or not.
  """
  def is_inside?(polygon, point, opts \\ [])

  def is_inside?(polygon, _point, _opts) when length(polygon) < 3 do
    false
  end

  # See https://www.david-gouveia.com/pathfinding-on-a-2d-polygonal-map
  def is_inside?(polygon, {_, _} = point, opts) when is_list(polygon) do
    epsilon = 0.5

    prev = Enum.at(polygon, -1)
    prev_sq_dist = Vector.distance_squared(prev, point)

    {_, _, is_inside} =
      Enum.reduce_while(polygon, {prev, prev_sq_dist, false}, fn current,
                                                                 {prev, prev_sq_dist, inside} ->
        sq_dist = Vector.distance_squared(current, point)

        if prev_sq_dist + sq_dist + 2.0 * :math.sqrt(prev_sq_dist * sq_dist) -
             Vector.distance_squared(current, prev) < epsilon do
          allow = Keyword.get(opts, :allow_border, true)
          {:halt, {prev, prev_sq_dist, allow}}
        else
          {x, y} = point
          {px, _py} = prev

          {left, right} =
            if x > px do
              {prev, current}
            else
              {current, prev}
            end

          {lx, ly} = left
          {rx, ry} = right

          inside =
            if lx < x and x <= rx and (y - ly) * (rx - lx) < (ry - ly) * (x - lx) do
              not inside
            else
              inside
            end

          {:cont, {current, sq_dist, inside}}
        end
      end)

    is_inside
  end

  @doc """
  The opposite of `is_inside?/3`, provided for code readability.
  """
  def is_outside?(polygon, point, opts \\ [])

  def is_outside?(polygon, _point, _opts) when length(polygon) < 3 do
    false
  end

  def is_outside?(polygon, point, opts) do
    not is_inside?(polygon, point, opts)
  end

  @doc """
  Find the edge of a polygon nearest a given point

  Given a `point` that's inside or outside a given `polygon`, this checks each
  segment of the polygon, and returns the nearest one.

  ## Params
  * `polygon`, a list of `{x, y}` vertices, `[{x1, y2}, {x2, y2}, ...]`. This
    must be non-closed.
  * `point` a tuple `{x, y}` describing a point

  Returns the `{{x1, y1}, {x2, y2}}` segment that is closest to the point.
  """
  @spec nearest_edge(polygon(), vector()) :: line()
  def nearest_edge(polygon, point) do
    # Get the closest segment of the polygon
    polygon
    |> Enum.chunk_every(2, 1, Enum.slice(polygon, 0, 2))
    |> Enum.map(fn [a, b] -> {a, b} end)
    |> Enum.min_by(&Geo.distance_to_segment(&1, point))
  end

  @doc """
  Find the point on the edge of a polygon nearest a given point.

  Given a `point` that's inside or outside a given `polygon`, this uses
  `nearest_edge/2` to find the closest edge and then computes the point on the
  edge nearest the given `point`.

  ## Params
  * `polygon`, a `t:polygon/0`..
  * `point` a tuple `{x, y}` describing a point

  Returns the `{x, y}` on an edge of the polygon that is nearest `point`.
  """
  @spec nearest_point_on_edge(polygon(), vector()) :: vector()
  def nearest_point_on_edge(polygon, point) do
    # Get the closest segment of the polygon
    {{x1, y1}, {x2, y2}} = nearest_edge(polygon, point)

    {x, y} = point

    u =
      ((x - x1) * (x2 - x1) + (y - y1) * (y2 - y1)) /
        ((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1))

    cond do
      u < 0 -> {x1, y1}
      u > 1 -> {x2, y2}
      true -> {x1 + u * (x2 - x1), y1 + u * (y2 - y1)}
    end
  end

  @doc """
  Check if the polygon is clockwise within screen coordinates.

  ## Params
  * `polygon` a `t:polygon/0` to check

  Returns `true` if the points in the polygon are defined in a clockwise
  orientation.

  ## Examples
      iex> Polygon.is_clockwise?([{0, 0}, {2, 0}, {2, 1}, {1, 0.5}, {0, 1}])
      true
      iex> Polygon.is_clockwise?([{0, 0}, {0, 1}, {1, 0.5}, {2, 1}, {2, 0}])
      false

  """
  @spec is_clockwise?(polygon()) :: boolean()
  def is_clockwise?(polygon) do
    a =
      polygon
      |> Enum.chunk_every(2, 1, Enum.slice(polygon, 0, 2))
      |> Enum.reduce(0, fn [{x1, y1}, {x2, y2}], acc -> acc + (x2 - x1) * (y2 + y1) end)

    a < 0
  end
end
