defmodule Scurry.PolygonMap do
  @moduledoc """
  Utility functions to work on a polygon map.

  A polygon map is a set of a primary polygon - the **main** boundary that
  outlines the world - and a list of polygons that make **holes** in the main
  polygon.

  See `Polygon` for details on how polygons are composed.

  The use case is eg. making a map (the **main** polygon) with obstacles (the
  **holes**), and use the `Astar` module to find the shortest path between
  points in the map.
  """

  alias Scurry.Polygon
  alias Scurry.Vector
  use Scurry.Types
  use Scurry.Astar.Types

  @doc """
  Given a polygon map (`world` & `holes`), returns a list of vertices for a
  walkmap for A-star search


  ## Params
  * `world`, a polygon that defines the outer boundary
  * `holes`, a list of polygons that define holes/obstacles inside `world`.

  ## Returns

  The walkmap, a list of vertices that are the `worlds`'s concave vertices and
  the convex ones of the `holes`.

  These are used when generating the walk map, since only the `world`'s concave
  and the `holes`' convex ones limit where you can traverse in a 2D map. Any
  path has to walk around the holes' convex points and the world's concave.

  See [Quickstart](quickstart.html) for a concrete example.
  """
  @spec get_vertices(polygon(), list(polygon())) :: list(vector())
  def get_vertices(world, holes) do
    {concave, _convex} = Polygon.classify_vertices(world)

    convex =
      Enum.reduce(holes, [], fn points, acc ->
        {_concave, convex} = Polygon.classify_vertices(points)
        acc ++ convex
      end)

    concave ++ convex
  end

  @doc """
  Given a polygon map (`world` & `holes`) and list of vertices, makes the walk
  graph for a A-star search.

  ## Params
  * `world`, a `t:polygon/0` that defines the outer boundary
  * `holes`, a list of `t:polygon/0`s that define holes/obstacles inside `world`.
  * `vertices`, the result of `get_vertices/2`.
  * `cost_fun`, a `t:cost_fun/0` function, defaults to `Scurry.Vector.distance/2`

  ## Returns

  A map of all node to node

  ## Todo

  This should ideally take `line_of_sight/3` as a function so users can
  customise which vertices can reach each other. But for now, users can make
  the graph themselves just as easily.

  See [Quickstart](quickstart.html) for a concrete example.
  """
  @spec create_graph(polygon(), list(polygon()), list(vector()), cost_fun()) :: graph()
  def create_graph(world, holes, vertices, cost_fun \\ nil)

  def create_graph(world, holes, vertices, nil) do
    create_graph(world, holes, vertices, &Vector.distance/2)
  end

  def create_graph(world, holes, vertices, cost_fun) do
    get_edges(world, holes, vertices, vertices, cost_fun)
  end

  @doc """
  Given a polygon map (main & holes), list of vertices and the initial graph,
  extend the graph with extra `points`.

  This is used to "temporarily" expand the fixed walk graph with the start and
  end-point. This is a performance optimisation that saves work by reusing the
  fixed nodes and extend it with the moveable points.

  ## Params
  * `polygons`, a `%{main: [...], hole: [...], hole2: [...]}` polygon map.
  * `graph`, the fixed graph, eg. created via `create_graph/2`.
  * `vertices` the nodes used to create `graph`.
  * `points` a list of coordinates, `[{x, y}, {x, y}...]`, to extend with
  * `cost_fun`, a `node, node :: cost` function, defaults to `Vector.distance`

  Returns an extended graph plus the combined list of vertices and new points,
  `{new_graph, new_vertices}`.
  """
  def extend_graph(graph, polygon, holes, vertices, points, cost_fun \\ nil)

  def extend_graph(graph, polygon, holes, vertices, points, nil) do
    extend_graph(graph, polygon, holes, vertices, points, &Vector.distance/2)
  end

  def extend_graph(graph, polygon, holes, vertices, points, cost_fun) do
    # To extend the graph `graph` made up up `vertices` with new points
    # `points`, we need to find three sets of edges (sub-graphs). The ones from
    # the new points to the existing vertices, vice-versa, and between the new
    # points.
    set_a = get_edges(polygon, holes, points, vertices, cost_fun)
    set_b = get_edges(polygon, holes, vertices, points, cost_fun)
    set_c = get_edges(polygon, holes, points, points, cost_fun)

    # Merge the three new sub-graphs into graph. This uses Map.merge with a
    # merge func that combines values for identical keys to extend them instead
    # of replacing, and dedupes.
    merge_fun = fn _k, v1, v2 ->
      Enum.dedup(v1 ++ v2)
    end

    graph =
      graph
      |> Map.merge(set_a, merge_fun)
      |> Map.merge(set_b, merge_fun)
      |> Map.merge(set_c, merge_fun)

    {graph, vertices ++ points}
  end

  @doc """
  Find the nearest point on the line that is inside the map and outside a hole.

  ## Params
  * `polygon`, a list of `{x, y}` vertices. This is the main boundary map.
  * `holes`, a list of lists of `{x, y}` vertices. These are holes within
    `polygon`.
  * `point` a tuple of coordinates (`{x, y}`) describing a point

  The function will return a new point `{bx, by}` for b such that;

  * if `{bx, by}` is outside the main map, the new b is the closest point on
    the main map.

  * if b is inside the main map, but also inside a hole, the new bis the
    closest point on the holes edges.
  """
  def nearest_point([], _, point) do
    point
  end

  def nearest_point(polygon, holes, point) do
    nearest_point_helper(polygon, holes, point, Polygon.is_inside?(polygon, point))
  end

  defp nearest_point_helper(_, holes, point, true) do
    nearest_point_in_holes(holes, point)
  end

  defp nearest_point_helper(points, _holes, point, false) do
    nearest_boundary_point_helper(points, point)
  end

  defp nearest_point_in_holes([], point) do
    point
  end

  defp nearest_point_in_holes([hole | holes], point) do
    nearest_point_in_holes_helper(
      [hole | holes],
      point,
      Polygon.is_inside?(hole, point, allow_border: false)
    )
  end

  defp nearest_point_in_holes_helper([_hole | holes], point, false) do
    nearest_point_in_holes(holes, point)
  end

  defp nearest_point_in_holes_helper([hole | _holes], point, true) do
    nearest_boundary_point_helper(hole, point)
  end

  defp nearest_boundary_point_helper(polygon, point) do
    {x, y} = Polygon.nearest_point_on_edge(polygon, point)

    # This is a problematic area - we want to round towards the start of the
    # line Eg. in complex.json scene, clicking {62, 310} yields {64.4, 308.8},
    # which naive rounding makes {64, 309}. This however places us *back*
    # *inside* the hole.

    # Some options are; try all four combos or floor/ceil and see which yields
    # the minimal distance - wrong, since the start might be on the far side of
    # a hole.

    # Shorten towards start? Same thing.

    # Actually run A-star to compute all four rounding and pick the shortest
    # path - that's a bit cpu heavy.

    # Compute all four rounding options and pick one that's *not* inside the
    # hole, and don't allow it to be on the border.

    p = {round(x), round(y)}
    a = {ceil(x), ceil(y)}
    b = {ceil(x), floor(y)}
    c = {floor(x), ceil(y)}
    d = {floor(x), floor(y)}

    cond do
      Polygon.is_outside?(polygon, p, allow_border: false) ->
        p

      Polygon.is_outside?(polygon, a, allow_border: false) ->
        a

      Polygon.is_outside?(polygon, b, allow_border: false) ->
        b

      Polygon.is_outside?(polygon, c, allow_border: false) ->
        c

      Polygon.is_outside?(polygon, d, allow_border: false) ->
        d
    end

    # If none of the points are outside, we'll pleasantly crash and we should
    # improve this to continuously move outwards a reasonable amount until
    # we're outside.
  end

  @doc """
  Checks if there's a line-of-sight (LOS) from `start` to `stop` within the map.

  ## Params
  * `polygon`, a list of `{x, y}` vertices. This is the main boundary map.
  * `holes`, a list of lists of `{x, y}` vertices. These are holes within
    `polygon`.
  * `line` a tuple of points (`{{ax, ay}, {bx, by}}`) describing a line.

  Returns `true` if there's a line-of-sight and none of the main polygon or
  holes obstruct the path. `false` otherwise.

  As the map consists of a boundary polygon with holes, LOS implies a few things;

  * If either `start` or `stop` is outside `polygon`, the result will be
    false. Even if both are outside, that's not considered a valid LOS.
  * If the distance between `start` and `stop` is tiny (< 0.1 arbitrarily), LOS
    is true.
  * Next, it checks that the line between `start` and `stop` has no
    intersections with `polygon` or `holes`.
  * Finally it checks if the middle of the line between `start` and `stop` is
    inside `polygon` and outside all holes - this ensures that corner-to-corner
    across a hole isn't considered a LOS.
  """
  def is_line_of_sight?(polygon, holes, line) do
    {start, stop} = line

    cond do
      not Polygon.is_inside?(polygon, start) or not Polygon.is_inside?(polygon, stop) ->
        false

      Vector.distance(start, stop) < 0.1 ->
        true

      not Enum.all?([polygon] ++ holes, fn points -> is_line_of_sight_helper(points, line) end) ->
        false

      true ->
        # This part ensures that two vertices across from each other are not
        # considered LOS. Without this, eg. a box-shaped hole would have
        # opposing corners be a LOS, except that the middle of the line falls
        # inside the hole per this check.
        middle = Vector.div(Vector.add(start, stop), 2)

        cond do
          not Polygon.is_inside?(polygon, middle) ->
            false

          Enum.all?(holes, fn hole -> Polygon.is_outside?(hole, middle, allow_border: false) end) ->
            true

          true ->
            false
        end
    end
  end

  defp is_line_of_sight_helper(polygon, {x, y} = line) do
    # We get all intersections and reject the ones that are identical to the
    # line. This allows us to enable "allow_points: true", but only see
    # intersections with other lines and _other_ polygon vertices (points).
    # This is necessary since we're always calling this with a line between two
    # polygon vertices. Without this, having "allow_points: true", every such
    # line would immediately intersect at both ends.

    Polygon.intersections(polygon, line, allow_points: true)
    |> Enum.map(fn {x, y} -> {round(x), round(y)} end)
    |> Enum.reject(fn p -> p == x or p == y end) ==
      []
  end

  # Get all edges from points_a and point_b for which there's line-of-sight.
  defp get_edges(world, holes, points_a, points_b, cost_fun) do
    is_reachable? = fn a, b -> is_line_of_sight?(world, holes, {a, b}) end

    # O(n^2) check all vertice combos for reachability...
    {_, all_edges} =
      Enum.reduce(points_a, {0, %{}}, fn a, {a_idx, acc1} ->
        {_, inner_edges} =
          Enum.reduce(points_b, {0, []}, fn b, {b_idx, acc2} ->
            # NOTE: this is where the edge value is becomes the key in the
            # graph. This is why a_idx and b_idx are available here, in case we
            # want to change it up to be the indexes into points. Unless those
            # two sets are the same, using the indexes makes no sense.
            if a != b and is_reachable?.(a, b) do
              {b_idx + 1, acc2 ++ [{b, cost_fun.(a, b)}]}
            else
              {b_idx + 1, acc2}
            end
          end)

        {a_idx + 1, Map.put(acc1, a, inner_edges)}
      end)

    Map.new(all_edges)
  end
end
