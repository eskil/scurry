defmodule PolygonMap do
  @moduledoc """
  Utility functions to work on a polygon map.

  A polygon map is a set of a primary polygon - the main boundary that outlines
  the world - and a list of polygons that make "holes" in the main polygon.

  See `Polygon` for details on how polygons are composed.

  The use case is eg. making a map with obstacles, and use the `Astar` module
  to find the shortest path between points in the map.
  """

  @doc """
  Given a polygon map (main, & holes), returns a list of vertices.

  The vertices are the main polygon's concave vertices and the convex ones of
  the holes.
  """
  def get_vertices(polygon, holes) do
    {concave, _convex} = Polygon.classify_vertices(polygon)
    convex = Enum.reduce(holes, [], fn points, acc ->
      {_concave, convex} = Polygon.classify_vertices(points)
      acc ++ convex
    end)

    concave ++ convex
  end

  @doc """
  Given a polygon map (main & holes) and list of vertices, makes the graph.

  ## Params
  * `cost_fun`, a `node, node :: cost` function, defaults to `Vector.distance`

  TODO: this should ideally take `line_of_sight` as a function so users can
  customise which vertices can reach each other. But for now, users can make
  the graph themselves just as easily.
  """
  def create_graph(polygon, holes, vertices, cost_fun \\ nil)

  def create_graph(polygon, holes, vertices, nil) do
    create_graph(polygon, holes, vertices, &Vector.distance/2)
  end

  def create_graph(polygon, holes, vertices, cost_fun) do
    get_edges(polygon, holes, vertices, vertices, cost_fun)
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
  * `points` a list of coordinates, `[{x, y}, {x, y}...]`, to extend
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
  * `line` a tuple of points (`{{ax, ay}, {bx, by}}`) describing a line.

  The function will return a new point `{bx, by}` for b such that;

  * if `{bx, by}` is outside the main map, the new b is the closest point on
    the main map.

  * if b is inside the main map, but also inside a hole, the new bis the
    closest point on the holes edges.
  """
  def nearest_point([], _, {_start, stop}=_line) do
    stop
  end

  def nearest_point(polygon, holes, line) do
    {_start, stop} = line
    nearest_point_helper(polygon, holes, line, Polygon.is_inside?(polygon, stop))
  end

  defp nearest_point_helper(_, holes, line, true) do
    nearest_point_in_holes(holes, line)
  end

  defp nearest_point_helper(points, _holes, line, false) do
    nearest_boundary_point_helper(points, line)
  end

  defp nearest_point_in_holes([], {_start, stop}=_line) do
    stop
  end

  defp nearest_point_in_holes([hole|holes], line) do
    {_start, stop} = line
    nearest_point_in_holes_helper([hole|holes], line, Polygon.is_inside?(hole, stop, allow_border: false))
  end

  defp nearest_point_in_holes_helper([_hole|holes], line, false) do
    nearest_point_in_holes(holes, line)
  end

  defp nearest_point_in_holes_helper([hole|_holes], line, true) do
    nearest_boundary_point_helper(hole, line)
  end

  defp nearest_boundary_point_helper(polygon, line) do
    {_start, stop} = line
    {x, y} = Polygon.nearest_point_on_edge(polygon, stop)

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
      not Polygon.is_inside?(polygon, start) or not Polygon.is_inside?(polygon, stop) -> false
      Vector.distance(start, stop) < 0.1 -> true
      not Enum.all?([polygon] ++ holes, fn points -> is_line_of_sight_helper(points, line) end) -> false
      true ->
          # This part ensures that two vertices across from each other are not
          # considered LOS. Without this, eg. a box-shaped hole would have
          # opposing corners be a LOS, except that the middle of the line falls
          # inside the hole per this check.
          middle = Vector.div(Vector.add(start, stop), 2)
          cond do
            not Polygon.is_inside?(polygon, middle) -> false
            Enum.all?(holes, fn hole -> Polygon.is_outside?(hole, middle, allow_border: false) end) -> true
            true -> false
          end
    end
  end

  defp is_line_of_sight_helper(polygon, {x, y}=line) do
    # We get all intersections and reject the ones that are identical to the
    # line. This allows us to enable "allow_points: true", but only see
    # intersections with other lines and _other_ polygon vertices (points).
    # This is necessary since we're always calling this with a line between two
    # polygon vertices. Without this, having "allow_points: true", every such
    # line would immediately intersect at both ends.

    Polygon.intersections(polygon, line, allow_points: true)
    |> Enum.map(fn {x, y} -> {round(x), round(y)} end)
    |> Enum.reject(fn p -> p == x or p == y end)
    == []
  end

  defp get_edges(polygon, holes, points_a, points_b, cost_fun) do
    is_reachable? = fn a, b -> is_line_of_sight?(polygon, holes, {a, b}) end

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
