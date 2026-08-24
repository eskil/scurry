defmodule Scurry.GeoTest do
  use ExUnit.Case, async: true

  alias Scurry.Geo
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

  ##
  ## Geo.merge
  ##

  test "merge when line entirely overlap" do
    a = [{0, 0}, {2, 0}, {2, 2}, {0, 2}]
    b = [{0, 2}, {2, 2}, {2, 3}, {0, 3}]
    expected = [
      [{0, 0}, {2, 0}, {2, 3}, {0, 3}]
    ]
    assert Geo.merge_polygons([a, b]) == expected
  end

  test "merge when line partially overlap" do
    a = [{0, 0}, {4, 0}, {4, 2}, {0, 2}]
    b = [{1, 2}, {2, 2}, {2, 3}, {1, 3}]
    expected = [
      [{0, 0}, {4, 0}, {4, 2}, {2, 2}, {2, 3}, {1, 3}, {1, 2}, {0, 2}]
    ]
    assert Geo.merge_polygons([a, b]) == expected
  end

  test "merge when no line overlap" do
    a = [{0, 0}, {2, 0}, {2, 2}, {0, 2}]
    b = [{0, 3}, {2, 3}, {2, 4}, {0, 4}]
    expected = [
      a, b
    ]
    assert Geo.merge_polygons([a, b]) == expected
  end

  test "merge recurses until there's no more changes" do
    # Three stacked boxes, none of which are adjacent to each other in the
    # list. The first pass can only merge one pair (b with c), which then
    # needs a second pass to merge with a, so this only passes if merge/1
    # keeps going until a full pass makes no changes.
    a = [{0, 0}, {2, 0}, {2, 2}, {0, 2}]
    b = [{0, 2}, {2, 2}, {2, 4}, {0, 4}]
    c = [{0, 4}, {2, 4}, {2, 6}, {0, 6}]
    expected = [{0, 0}, {2, 0}, {2, 6}, {0, 6}]

    assert [merged] = Geo.merge_polygons([b, c, a])
    assert rotate_to(merged, {0, 0}) == expected
  end

  test "merge cancels multiple overlapping edges between the same two polygons" do
    # `a` is a 4x4 square with a 2x2 notch cut out of its top-right corner,
    # and `b` is the 2x2 square that exactly fills the notch. They share two
    # separate edges (the notch's bottom and left inner edges) at once, not
    # just one, so this only passes if every overlapping edge pair gets
    # cancelled, not just the first one found.
    a = [{0, 0}, {4, 0}, {4, 2}, {2, 2}, {2, 4}, {0, 4}]
    b = [{2, 2}, {4, 2}, {4, 4}, {2, 4}]
    expected = [
      [{0, 0}, {4, 0}, {4, 4}, {0, 4}]
    ]
    assert Geo.merge_polygons([a, b]) == expected
  end

  test "merge combines many polygons sharing a common vertex" do
    # Four unit squares arranged in a 2x2 grid, all meeting at {1, 1}. Every
    # square shares a full edge with its two orthogonal neighbours (but only
    # touches its diagonal neighbour at that single shared point), so this
    # only passes if overlapping edges are cancelled across every pair in
    # the list, not just adjacent list entries, and a point-touch alone
    # isn't mistaken for an edge overlap.
    p1 = [{0, 0}, {1, 0}, {1, 1}, {0, 1}]
    p2 = [{1, 0}, {2, 0}, {2, 1}, {1, 1}]
    p3 = [{1, 1}, {2, 1}, {2, 2}, {1, 2}]
    p4 = [{0, 1}, {1, 1}, {1, 2}, {0, 2}]
    expected = [
      [{0, 0}, {2, 0}, {2, 2}, {0, 2}]
    ]
    assert Geo.merge_polygons([p1, p2, p3, p4]) == expected
  end

  # Merge doesn't guarantee which vertex a merged polygon starts at, so
  # rotate it back to a known starting vertex before comparing.
  defp rotate_to(polygon, start) do
    # Find the index of "start" in the pology
    index = Enum.find_index(polygon, &(&1 == start))
    # Split into two lists, before/after start vertice
    {before, from_start} = Enum.split(polygon, index)
    # Reassemble list
    from_start ++ before
  end
end
