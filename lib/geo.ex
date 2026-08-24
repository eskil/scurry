defmodule Scurry.Geo do
  @moduledoc """
  Geometry functions related to lines relevant for 2D map pathfinding.
  """

  alias Scurry.Vector
  use Scurry.Types

  # For explanation of a lot of the math here;
  # * https://khorbushko.github.io/article/2021/07/15/the-area-polygon-or-how-to-detect-line-segments-intersection.html
  # * https://stackoverflow.com/questions/563198/how-do-you-detect-where-two-line-segments-intersect/1968345#1968345
  @doc """
  Determine if, where and how two lines intersect.

  This function computes whether two lines intersect (cross each other) touch
  on an endpoint or are on top of each other.

  ## Params

  * `line1` (`t:line/0`) a line segment
  * `line2` (`t:line/0`) a line segment to check where and how it intersects with `line1`.

  ## Returns

  * `:none` no intersection.
  * `:parallel` the lines are parallel and _do not_ intersect.
  * `:on_segment` one line is on the other. They may extend past each other's endpoints.
  * `{:point_intersection, vector}` either line has an _endpoint_ on the other
    line. This means they just touch at the returned vector.
  * `{:intersection, vector}` the lines intersect at the returned vector.

  ## Examples
      iex> Geo.line_segment_intersection({{1, 2}, {4, 2}}, {{2, 0}, {3, 0}})
      :parallel
      iex> Geo.line_segment_intersection({{1, 2}, {4, 2}}, {{2, 2}, {3, 2}})
      :on_segment
      iex> Geo.line_segment_intersection({{1, 2}, {4, 2}}, {{2, 2}, {5, 2}})
      :on_segment
      iex> Geo.line_segment_intersection({{1, 2}, {4, 2}}, {{2, 0}, {2, 1}})
      :none
      iex> Geo.line_segment_intersection({{1, 2}, {4, 2}}, {{2, 0}, {2, 2}})
      {:point_intersection, {2.0, 2.0}}
      iex> Geo.line_segment_intersection({{1, 2}, {4, 2}}, {{2, 0}, {2, 3}})
      {:intersection, {2.0, 2.0}}
  """
  @spec line_segment_intersection(line(), line()) :: :none | :parallel | :on_segment | {:point_intersection, vector()} | {:intersection, vector()}
  def line_segment_intersection(line1, line2) do
    {{ax1, ay1}, {ax2, ay2}} = line1
    {{bx1, by1}, {bx2, by2}} = line2
    den = (by2 - by1) * (ax2 - ax1) - (bx2 - bx1) * (ay2 - ay1)

    if den == 0 do
      if (by1 - ay1) * (ax2 - ax1) == (bx1 - ax1) * (ay2 - ay1) do
        :on_segment
      else
        :parallel
      end
    else
      ua = ((bx2 - bx1) * (ay1 - by1) - (by2 - by1) * (ax1 - bx1)) / den
      ub = ((ax2 - ax1) * (ay1 - by1) - (ay2 - ay1) * (ax1 - bx1)) / den

      if ua >= 0.0 and ua <= 1.0 and ub >= 0.0 and ub <= 1.0 do
        {x, y} = {ax1 + ua * (ax2 - ax1), ay1 + ua * (ay2 - ay1)}

        if ua == 0.0 or ub == 1.0 or ua == 1.0 or ub == 0.0 do
          {:point_intersection, {x, y}}
        else
          {:intersection, {x, y}}
        end
      else
        :none
      end
    end
  end

  @doc """
  Get the distance squared from `point` to `line`.

  ## Params

  * `line` (`t:line/0`) the line to compute the distance squared to.
  * `point` (`t:vector/0`) the point to compute the distance squared to `line` for.

  ## Returns

  The square of the distance beween the given `point` and `line`.

  ## Examples
      iex> Geo.distance_to_segment_squared({{2, 0}, {2, 2}}, {0, 1})
      4.0
  """
  @spec distance_to_segment_squared(line(), vector()) :: float()
  def distance_to_segment_squared({{vx, vy} = v, {wx, wy} = w} = _line, {px, py} = point) do
    l2 = Vector.distance_squared(v, w)

    if l2 == 0.0 do
      Vector.distance_squared(point, v)
    else
      t = ((px - vx) * (wx - vx) + (py - vy) * (wy - vy)) / l2

      cond do
        t < 0 -> Vector.distance_squared(point, v)
        t > 1 -> Vector.distance_squared(point, w)
        true -> Vector.distance_squared(point, {vx + t * (wx - vx), vy + t * (wy - vy)})
      end
    end
  end

  @doc """
  Get the distance from a point to a line/segment.

  This is  the square root of `distance_squared/2`.

  ## Params

  * `line` (`t:line/0`) the line to compute the distance to.
  * `point` (`t:vector/0`) the point to compute the distance to `line` for.

  ## Returns

  The distance beween the given `point` and `line`.

  ## Examples
      iex> Geo.distance_to_segment({{2, 0}, {2, 2}}, {0, 1})
      2.0
  """
  @spec distance_to_segment(line(), vector()) :: float()
  def distance_to_segment(line, point) do
    :math.sqrt(distance_to_segment_squared(line, point))
  end

  @doc """
  Check if two lines intersect

  This is a simpler version of `line_segment_intersection/2`, which is typically
  a better choice since it handles endpoints and segment overlap too.

  This is kept/provided for historic purposes.

  ## Params
  * `line1` (`t:line/0`) a line to check for intersection with
  * `line2` (`t:line/0`) a line to check if it intersects with `line1`.

  ## Returns

  `true` if they intersect, `false` otherwise.

  > ## Note
  >
  > This doesn't handle segment overlap or points touching. Use
  > `line_segment_intersection/2` instead for that level of detail.
  """
  # ported from http://www.david-gouveia.com/portfolio/pathfinding-on-a-2d-polygonal-map/
  @spec do_lines_intersect?(line(), line()) :: boolean()
  def do_lines_intersect?({{ax1, ay1}, {ax2, ay2}} = _line1, {{bx1, by1}, {bx2, by2}} = _line2) do
    den = (ax2 - ax1) * (by2 - by1) - (ay2 - ay1) * (bx2 - bx1)

    if den == 0 do
      false
    else
      num1 = (ay1 - by1) * (bx2 - bx1) - (ax1 - bx1) * (by2 - by1)
      num2 = (ay1 - by1) * (ax2 - ax1) - (ax1 - bx1) * (ay2 - ay1)

      if num1 == 0 or num2 == 0 do
        false
      else
        r = num1 / den
        s = num2 / den
        r > 0 and r < 1 and (s > 0 and s < 1)
      end
    end
  end

  @doc """
  Merge polygons.

  Iterate over all vertices of the given polygons and merge where vertices
  are `:on_segment` with each other. This allows you to manage your polygons as sharing
  vectors and combine into larger polygons.

  This iterates over all the polygons and their vertices and uses
  `line_segment_intersection/2` to check for overlap. If the overlap is
  `:on_segment` (meaning the two vertices entirely or partially are on top of each other,
  the two vertices are merged to join the polygons.
  """

  @spec merge_polygons([polygon()]) :: [polygon()]
  def merge_polygons(polygons) do
    # Recursive merge until there's no longer any changes.
    case merge_polygons_once(polygons) do
      {:merged, polygons} -> merge_polygons(polygons)
      :unchanged -> polygons
    end
  end

  # Try to merge one pair of polygons in the list. Returns `{:merged, list}`
  # with the merged pair spliced in, or `:unchanged` if no pair overlaps.
  defp merge_polygons_once(polygons) do
    count = length(polygons)

    Enum.find_value(0..(count - 1)//1, :unchanged, fn i ->
      Enum.find_value((i + 1)..(count - 1)//1, fn j ->
        a = Enum.at(polygons, i)
        b = Enum.at(polygons, j)

        case merge_polygon_pair(a, b) do
          {:merged, merged} ->
            rest =
              polygons
              |> List.delete_at(j)
              |> List.delete_at(i)

            {:merged, [merged | rest]}

          :no_overlap ->
            nil
        end
      end)
    end)
  end

  # Merge two polygons that share (part of) an edge. `:on_segment` edge pairs
  # are found, the shared portions are cancelled out of both polygons and the
  # remaining edges are walked to reconstruct the combined boundary.
  defp merge_polygon_pair(a, b) do
    edges_a = polygon_edges(a)
    edges_b = polygon_edges(b)

    overlaps = find_edge_overlaps(edges_a, edges_b)

    case overlaps do
      [] ->
        :no_overlap

      _ ->
        final_edges =
          replace_overlapping_edges(edges_a, overlaps, :a) ++
            replace_overlapping_edges(edges_b, overlaps, :b)

        merged =
          final_edges
          |> walk_edges()
          |> remove_collinear_vertices()

        {:merged, merged}
    end
  end

  # Turn a polygon's vertex list into its directed boundary edges, each a
  # `{from, to}` pair in the polygon's own winding order, wrapping the last
  # edge back around to the first vertex.
  defp polygon_edges(polygon) do
    polygon
    |> Enum.chunk_every(2, 1, Enum.slice(polygon, 0, 2))
    |> Enum.map(fn [p1, p2] -> {p1, p2} end)
  end

  # Compare every edge of `edges_a` against every edge of `edges_b` and
  # collect the ones that genuinely overlap (not just touch at a point).
  # A polygon pair can share more than one edge (eg. one polygon filling a
  # notch in another), so this returns *all* overlapping pairs found, not
  # just the first.
  defp find_edge_overlaps(edges_a, edges_b) do
    for ea <- edges_a,
        eb <- edges_b,
        line_segment_intersection(ea, eb) == :on_segment,
        range = overlap_range(ea, eb),
        range != :none do
      {ea, eb, range}
    end
  end

  # Given two collinear, overlapping edges, find the two points that bound
  # the overlapping portion. These are always among the edges' own vertices,
  # since the boundary of the intersection of two ranges is always one of
  # the ranges' own endpoints.
  defp overlap_range({p1, p2} = _edge_p, {q1, q2} = _edge_q) do
    dir = Vector.sub(p2, p1)
    t = fn point -> Vector.dot(Vector.sub(point, p1), dir) end

    points = [{t.(p1), p1}, {t.(p2), p2}, {t.(q1), q1}, {t.(q2), q2}]
    p_ts = [t.(p1), t.(p2)]
    q_ts = [t.(q1), t.(q2)]

    lo_t = max(Enum.min(p_ts), Enum.min(q_ts))
    hi_t = min(Enum.max(p_ts), Enum.max(q_ts))

    if lo_t >= hi_t do
      :none
    else
      {_, lo_point} = Enum.find(points, fn {tt, _} -> tt == lo_t end)
      {_, hi_point} = Enum.find(points, fn {tt, _} -> tt == hi_t end)
      {lo_point, hi_point}
    end
  end

  # Rebuild `edges` (from one side of an overlapping pair) with any edge
  # that has a matching overlap replaced by what's left of it once the
  # shared portion is cut out. Edges with no overlap pass through unchanged.
  defp replace_overlapping_edges(edges, overlaps, side) do
    Enum.flat_map(edges, fn edge ->
      case find_overlap_for(edge, overlaps, side) do
        nil -> [edge]
        range -> split_edge(edge, range)
      end
    end)
  end

  # Look up the overlap range recorded for `edge` on the given `side` (`:a`
  # for `edges_a`, `:b` for `edges_b`) of an `{ea, eb, range}` overlap
  # tuple, or `nil` if this edge isn't part of any overlap.
  defp find_overlap_for(edge, overlaps, :a) do
    Enum.find_value(overlaps, fn {ea, _eb, range} -> ea == edge && range end)
  end

  defp find_overlap_for(edge, overlaps, :b) do
    Enum.find_value(overlaps, fn {_ea, eb, range} -> eb == edge && range end)
  end

  # Remove the (lo, hi) portion of `edge`, keeping whatever is left on
  # either side of it, preserving the edge's own direction.
  defp split_edge({a, b} = _edge, {pt1, pt2} = _range) do
    dir = Vector.sub(b, a)
    t = fn point -> Vector.dot(Vector.sub(point, a), dir) end

    {near_a, near_b} = if t.(pt1) <= t.(pt2), do: {pt1, pt2}, else: {pt2, pt1}

    head = if a == near_a, do: [], else: [{a, near_a}]
    tail = if b == near_b, do: [], else: [{near_b, b}]

    head ++ tail
  end

  # Walk the remaining directed edges from vertex to vertex until we're back
  # at the start, reconstructing the merged polygon's vertex list.
  defp walk_edges(edges) do
    edge_map = Map.new(edges, fn {p1, p2} -> {p1, p2} end)
    {start, _} = hd(edges)

    walk_edges(edge_map, start, start, [start])
  end

  # Follow `edge_map` one hop at a time from `current`, accumulating
  # vertices, until we arrive back at `start`, then return them in order.
  defp walk_edges(edge_map, start, current, acc) do
    next = Map.fetch!(edge_map, current)

    if next == start do
      Enum.reverse(acc)
    else
      walk_edges(edge_map, start, next, [next | acc])
    end
  end

  # Drop vertices that fall exactly on the straight line between their
  # neighbours - these are left behind where a shared edge used to be.
  defp remove_collinear_vertices(polygon) do
    count = length(polygon)

    polygon
    |> Enum.with_index()
    |> Enum.reject(fn {point, idx} ->
      prev = Enum.at(polygon, rem(idx - 1 + count, count))
      next = Enum.at(polygon, rem(idx + 1, count))

      left = Vector.sub(point, prev)
      right = Vector.sub(next, point)

      Vector.cross(left, right) == 0 && Vector.dot(left, right) > 0
    end)
    |> Enum.map(fn {point, _idx} -> point end)
  end
end
