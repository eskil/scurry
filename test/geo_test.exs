defmodule GeoTest do
  use ExUnit.Case, async: true

  doctest Geo

  ##
  ## Geo.do_lines_intersect?
  ##
  test "do_lines_intersect? no" do
    line1 = {{0, 0}, {2, 0}}
    line2 = {{0, 2}, {2, 2}}
    assert Geo.do_lines_intersect?(line1, line2) == false
  end

  test "do_lines_intersect? cross" do
    line1 = {{0, 0}, {2, 2}}
    line2 = {{0, 2}, {2, 0}}
    assert Geo.do_lines_intersect?(line1, line2) == true
  end

  test "do_lines_intersect? on segment" do
    line1 = {{0, 0}, {3, 3}}
    line2 = {{1, 1}, {2, 2}}
    assert Geo.do_lines_intersect?(line1, line2) == false
  end

  test "do_lines_intersect? point" do
    line1 = {{0, 0}, {1, 1}}
    line2 = {{1, 1}, {2, 2}}
    assert Geo.do_lines_intersect?(line1, line2) == false
  end

  ##
  ## Geo.distance_to_segment(_squared)
  ##

  test "distance_to_segment_squared on segment but it's a point" do
    point = {2, 2}
    line = {{2, 0}, {2, 0}}
    assert Geo.distance_to_segment_squared(line, point) == 4.0
    assert Geo.distance_to_segment(line, point) == 2.0
  end

  test "distance_to_segment_squared on segment" do
    point = {2, 2}
    line = {{2, 0}, {2, 3}}
    assert Geo.distance_to_segment_squared(line, point) == 0
    assert Geo.distance_to_segment(line, point) == 0
  end

  test "distance_to_segment_squared left of segment" do
    point = {0, 2}
    line = {{2, 0}, {2, 3}}
    assert Geo.distance_to_segment_squared(line, point) == 4.0
    assert Geo.distance_to_segment(line, point) == 2.0
  end

  test "distance_to_segment_squared right of segment" do
    point = {4, 2}
    line = {{2, 0}, {2, 3}}
    assert Geo.distance_to_segment_squared(line, point) == 4.0
    assert Geo.distance_to_segment(line, point) == 2.0
  end

  test "distance_to_segment_squared in line with segment" do
    point = {2, 0}
    line = {{2, 2}, {2, 3}}
    assert Geo.distance_to_segment_squared(line, point) == 4.0
    assert Geo.distance_to_segment(line, point) == 2.0
  end

  test "distance_to_segment_squared on end of segment" do
    point = {2, 2}
    line = {{2, 2}, {2, 3}}
    assert Geo.distance_to_segment_squared(line, point) == 0
    assert Geo.distance_to_segment(line, point) == 0
  end
end
