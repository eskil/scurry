defmodule Scurry.Geo do
  @moduledoc """
  Functions related to lines relevant for 2D map pathfinding.

  """

  alias Scurry.Vector

  # For explanation of a lot of the math here;
  # * https://khorbushko.github.io/article/2021/07/15/the-area-polygon-or-how-to-detect-line-segments-intersection.html
  # * https://stackoverflow.com/questions/563198/how-do-you-detect-where-two-line-segments-intersect/1968345#1968345
  @doc """
  Determine if, where and how two lines intersect.

  ## Params
  * `line1` a `{{x1, y1}, {x2, y2}}` line segment
  * `line2` a `{{x3, y13, {x4, y4}}` line segment

  Returns
  * `:on_segment` one line is on the other.
  * `:parallel` the lines are parallel and do not intersect.
  * `{:point_intersection, {x, y}}` either line has an _endpoint_ (`{x, y}`) on
    the other line.
  * `{:intersection, {x, y}}` the lines intersect at `{x, y}`.
  * `:none` no intersection.

  ## Examples
      iex> Geo.line_segment_intersection({{1, 2}, {4, 2}}, {{2, 0}, {3, 0}})
      :parallel
      iex> Geo.line_segment_intersection({{1, 2}, {4, 2}}, {{2, 2}, {3, 2}})
      :on_segment
      iex> Geo.line_segment_intersection({{1, 2}, {4, 2}}, {{2, 0}, {2, 1}})
      :none
      iex> Geo.line_segment_intersection({{1, 2}, {4, 2}}, {{2, 0}, {2, 2}})
      {:point_intersection, {2.0, 2.0}}
      iex> Geo.line_segment_intersection({{1, 2}, {4, 2}}, {{2, 0}, {2, 3}})
      {:intersection, {2.0, 2.0}}
  """
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
  Get the distance squared from a point to a line/segment.

  ## Params
  * `line` a tuple of points (`{{ax, ay}, {bx, by}}`) describing a line.
  * `point` a tuple `{x, y}` describing a point

  This returns the square of the distance beween the given point and segment as
  a float.

  ## Examples
      iex> Geo.distance_to_segment_squared({{2, 0}, {2, 2}}, {0, 1})
      4.0
  """
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
  Get the distance from a point to a line/segment, aka the square root of
  `distance_squared/2`.

  ## Params
  * `line` a tuple of points (`{{ax, ay}, {bx, by}}`) describing a line.
  * `point` a tuple `{x, y}` describing a point

  This returns the distance beween the given point and segment as a float.

  ## Examples
      iex> Geo.distance_to_segment({{2, 0}, {2, 2}}, {0, 1})
      2.0
  """
  def distance_to_segment(line, point) do
    :math.sqrt(distance_to_segment_squared(line, point))
  end

  # ported from http://www.david-gouveia.com/portfolio/pathfinding-on-a-2d-polygonal-map/
  @doc """
  Check if two lines intersect

  This is a simpler version of `line_segment_intersection/2`, which is typically
  a better choice since it handles endpoints and segment overlap too.

  ## Params
  * `line1` a `{{x1, y1}, {x2, y2}}` line segment
  * `line2` a `{{x3, y13, {x4, y4}}` line segment

  Returns `true` if they intersect, `false` otherwise.

  Note that this doesn't handle segment overlap or points touching. Use
  `line_segment_intersection/2` instead for that level of detail.
  """
  def do_lines_intersect?({{ax1, ay1}, {ax2, ay2}} = _l1, {{bx1, by1}, {bx2, by2}} = _l2) do
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
end
