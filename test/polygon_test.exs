defmodule PolygonTest do
  use ExUnit.Case, async: true

  doctest Polygon

  # defp box_polygon(), do: [{0, 10}, {10, 10}, {10, 0}, {0, 0}]
  # defp m_polygon(), do: [{0, 0}, {10, 0}, {20, 0}, {20, 20}, {10, 10}, {0, 20}]
  # defp mflag_polygon(), do: polygon = [{0, 0}, {10, 0}, {5, 10}, {10, 20}, {0, 20}]

  ##
  ## Polygon.intersects?
  ##

  test "intersects? detects point intersection" do
    line = {{5, 5}, {15, 15}}
    # Box
    polygon = [{0, 10}, {10, 10}, {10, 0}, {0, 0}]
    assert Polygon.intersects?(polygon, line) == {:point_intersection, {10.0, 10.0}}
  end

  test "intersects? detects edge intersection" do
    line = {{5, 5}, {5, 15}}
    # Box
    polygon = [{0, 10}, {10, 10}, {10, 0}, {0, 0}]
    assert Polygon.intersects?(polygon, line) == {:intersection, {5.0, 10.0}}
  end

  test "intersects? detects no intersection" do
    line = {{20, 20}, {30, 30}}
    # Box
    polygon = [{0, 10}, {10, 10}, {10, 0}, {0, 0}]
    assert Polygon.intersects?(polygon, line) == :nointersection
  end

  test "intersects? detects segment" do
    line = {{1, 10}, {9, 10}}
    # Box
    polygon = [{0, 10}, {10, 10}, {10, 0}]
    assert Polygon.intersects?(polygon, line) == :on_segment
  end

  ##
  ## Polygon.intersections
  ##

  test "can get multiple intersections when there's two points" do
    line = {{6, 1}, {6, 19}}
    # Sideways M / flag style
    polygon = [{0, 0}, {10, 0}, {5, 10}, {10, 20}, {0, 20}]
    assert Polygon.intersections(polygon, line) == [{6.0, 8.0}, {6.0, 12.0}]
  end

  test "can get multiple intersections when there's no intersections" do
    line = {{6, 1}, {6, 3}}
    # Sideways M / flag style
    polygon = [{0, 0}, {10, 0}, {5, 10}, {10, 20}, {0, 20}]
    assert Polygon.intersections(polygon, line) == []
  end

  test "intersections when it's on segment" do
    line = {{0, 1}, {0, 3}}
    # Sideways M / flag style
    polygon = [{0, 0}, {10, 0}, {5, 10}, {10, 20}, {0, 20}]
    assert Polygon.intersections(polygon, line) == []
  end

  ##
  ## Polygon.first/last_intersection
  ##

  test "find first/last intersection when there's two points" do
    line = {{6, 1}, {6, 19}}
    # Sideways M / flag style
    polygon = [{0, 0}, {10, 0}, {5, 10}, {10, 20}, {0, 20}]
    assert Polygon.first_intersection(polygon, line) == {6.0, 8.0}
    assert Polygon.last_intersection(polygon, line) == {6.0, 12.0}
  end

  test "find first/last intersection when there's no intersections" do
    line = {{6, 1}, {6, 3}}
    # Sideways M / flag style
    polygon = [{0, 0}, {10, 0}, {5, 10}, {10, 20}, {0, 20}]
    assert Polygon.first_intersection(polygon, line) == nil
    assert Polygon.last_intersection(polygon, line) == nil
  end

  ##
  ## Polygon.is_inside?/outside?
  ##

  test "is_inside/outside not a polygon" do
    polygon = [{0, 0}, {2, 0}]
    point = {1, 1}
    assert Polygon.is_inside?(polygon, point) == false
    assert Polygon.is_outside?(polygon, point) == false
  end

  test "is_inside/outside triangle" do
    polygon = [{0, 0}, {2, 0}, {2, 2}]
    point = {1, 1}
    assert Polygon.is_inside?(polygon, point) == true
    assert Polygon.is_outside?(polygon, point) == false
  end

  test "is_inside/outside a box" do
    # Small Box
    polygon = [{0, 0}, {2, 0}, {2, 2}, {0, 2}]
    point = {1, 1}
    assert Polygon.is_inside?(polygon, point) == true
    assert Polygon.is_outside?(polygon, point) == false
  end

  test "is_inside/outside on edge is allowed and default" do
    # Small Box
    polygon = [{0, 0}, {2, 0}, {2, 2}, {0, 2}]
    point = {2, 1}
    assert Polygon.is_inside?(polygon, point) == true
    assert Polygon.is_outside?(polygon, point) == false
  end

  test "is_inside/outside on edge but not allowed" do
    # Small Box
    polygon = [{0, 0}, {2, 0}, {2, 2}, {0, 2}]
    point = {2, 1}
    assert Polygon.is_inside?(polygon, point, allow_border: false) == false
    assert Polygon.is_outside?(polygon, point, allow_border: false) == true
  end

  test "is_inside/outside on vertex is allowed and default" do
    # Small Box
    polygon = [{0, 0}, {2, 0}, {2, 2}, {0, 2}]
    point = {2, 2}
    assert Polygon.is_inside?(polygon, point) == true
    assert Polygon.is_outside?(polygon, point) == false
  end

  test "is_inside/outside on vertex but not allowed" do
    # Small Box
    polygon = [{0, 0}, {2, 0}, {2, 2}, {0, 2}]
    point = {2, 2}
    assert Polygon.is_inside?(polygon, point, allow_border: false) == false
    assert Polygon.is_outside?(polygon, point, allow_border: false) == true
  end

  ##
  ## Polygon.classify / is_concave / is_convex
  ##

  test "classify_vertices" do
    # M shape
    polygon = [{0, 0}, {10, 0}, {20, 0}, {20, 20}, {10, 10}, {0, 20}]
    assert Polygon.classify_vertices(polygon) == {[{10, 10}], [{0, 0}, {20, 0}, {20, 20}, {0, 20}]}
  end

  test "classify_vertices triangle" do
    triangle = [{50, 70}, {70, 50}, {70, 70}]
    assert Polygon.classify_vertices(triangle) == {[], triangle}
  end

  test "classify_vertices squiggle" do
    polygon = [{250, 170}, {256, 153}, {270, 160}, {295, 185}]
    assert Polygon.classify_vertices(polygon) == {[], polygon}
  end

  ##
  ## Polygon.nearest_edge
  ##

  test "nearest_edge" do
    # Box
    polygon = [{0, 0}, {2, 0}, {2, 2}, {0, 2}]
    assert Polygon.nearest_edge(polygon, {-1, 1}) == {{0, 2}, {0, 0}}
    assert Polygon.nearest_edge(polygon, {1, 2.5}) == {{2, 2}, {0, 2}}
    assert Polygon.nearest_edge(polygon, {3, 1}) == {{2, 0}, {2, 2}}
  end

  ##
  ## Polygon.nearest_point_on_edge
  ##

  test "nearest_point_on_edge" do
    # Box
    polygon = [{0, 0}, {2, 0}, {2, 2}, {0, 2}]
    # Walk around a few edges
    assert Polygon.nearest_point_on_edge(polygon, {-1, 1}) == {0, 1}
    assert Polygon.nearest_point_on_edge(polygon, {1, 2.5}) == {1, 2}
    assert Polygon.nearest_point_on_edge(polygon, {3, 1}) == {2, 1}

    # Near points of edges
    assert Polygon.nearest_point_on_edge(polygon, {3, 3}) == {2, 2}
    assert Polygon.nearest_point_on_edge(polygon, {3, -1}) == {2, 0}
    assert Polygon.nearest_point_on_edge(polygon, {-1, -1}) == {0, 0}
    assert Polygon.nearest_point_on_edge(polygon, {-1, 3}) == {0, 2}
  end

end
