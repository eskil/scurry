defmodule Scurry.Vector do
  @moduledoc """
  Functions to work on 2D vectors.

  Vectors are represented as tuples of x and y components, `{x :: number, y :: number}`. This
  module provides basic trigonometry functions.

  See [Euclidian Vector](https://en.wikipedia.org/wiki/Euclidean_vector) on
  Wikipedia for further descriptions of the maths and use cases.
  """

  use Scurry.Types

  @doc """
  Get the length of a vector, aka magnitude.

  ## Params

  * `v`, a `t:vector/0` describing the vector.

  Returns the length of the vector `v`.

  ## Examples
      iex> Vector.len({1, 1})
      1.4142135623730951
      iex> Vector.len({3, 4})
      5.0
      iex> Vector.len({12, 5})
      13.0
  """
  @spec len(v :: vector()) :: float()
  def len({x, y} = _v) do
    :math.sqrt(x * x + y * y)
  end

  @doc """
  Add two vectors together.

  ## Params

  * `v1` a `t:vector/0` describing the first vector.
  * `v2` a `t:vector/0` describing the second vector.

  Returns the resulting vector of adding the two vectors together.

  ## Examples
      iex> Vector.add({1, 2}, {3, 4})
      {4, 6}
  """
  @spec add(v1 :: vector(), v2 :: vector()) :: vector()
  def add({ax, ay} = _v1, {bx, by} = _v2) do
    {ax + bx, ay + by}
  end

  @doc """
  Subtract a vector from another.

  ## Params

  * `v1` a `t:vector/0` describing the first vector.
  * `v2` a `t:vector/0` describing the second vector.

  Returns the result vector of subtracting of `v2` from `v1`.

  ## Examples
      iex> Vector.sub({5, 7}, {1, 2})
      {4, 5}
  """
  @spec sub(v1 :: vector(), v2 :: vector()) :: vector()
  def sub({ax, ay} = _v1, {bx, by} = _v2) do
    {ax - bx, ay - by}
  end

  @doc """
  Divide a vector by a constant.

  ## Params

  * `v` a `t:vector/0` describing the vector.
  * `c` the constant to divide by.

  Returns the result of dividing `v` by `c`.

  ## Examples
      iex> Vector.div({10, 14}, 2)
      {5.0, 7.0}
  """
  @spec div(v :: vector(), c :: number()) :: vector()
  def div({x, y} = _v, c) do
    {x / c, y / c}
  end

  @doc """
  Multiply a vector by a constant.

  ## Params

  * `v` a `t:vector/0` describing the vector.
  * `c` the constant to multiple by.

  Returns the result of multiplying `v` by `c`.

  ## Examples
      iex> Vector.mul({5, 7}, 2)
      {10, 14}
  """
  @spec mul(v :: vector(), c :: number()) :: vector()
  def mul({x, y} = _v, c) do
    {x * c, y * c}
  end

  @doc """
  Get the distance of two vectors.

  The distance is the length of the vector between the ends (second tuple) of the vectors.

  This is equivalent to the square root of the `distance_squared/2`.

  ## Params

  * `v1` a `t:vector/0` describing the first vector.
  * `v2` a `t:vector/0` describing the second vector.

  Returns the distance between the ends of `v1` and `v2`.

  ## Examples
      iex> Vector.distance({0, 0}, {1, 1})
      1.4142135623730951
      iex> Vector.distance({5, 7}, {2, 3})
      5.0
  """
  @spec distance(v1 :: vector(), v2 :: vector()) :: float()
  def distance({_ax, _ay} = v1, {_bx, _by} = v2) do
    :math.sqrt(distance_squared(v1, v2))
  end

  @doc """
  Get the distance squared of two vectors.

  This is equivalent to the square of the `distance/2`.

  ## Params

  * `v1` a `t:vector/0` describing the first vector.
  * `v2` a `t:vector/0` describing the second vector.

  Returns the squared distance between the ends of `v1` and `v2`.

  ## Examples
      iex> Vector.distance_squared({0, 0}, {1, 1})
      2.0
      iex> Vector.distance_squared({5, 7}, {2, 3})
      25.0
  """
  @spec distance_squared(v1 :: vector(), v2 :: vector()) :: float()
  def distance_squared({ax, ay} = _v1, {bx, by} = _v2) do
    :math.pow(ax - bx, 2) + :math.pow(ay - by, 2)
  end

  @doc """
  Normalise a vector to length 1.

  This shortens the vector by it's length, so the resulting vector `w` has
  `len(w) == 1`, and same x/y ratio.

  ## Params

  * `v` a `t:vector/0` describing the vector to normalise.

  Returns a `t:vector/0` with length 1, and same x/y ratio.

  ## Examples
      iex> Vector.normalise({0, 1})
      {0.0, 1.0}
      iex> Vector.normalise({10, 0})
      {1.0, 0.0}
      iex> Vector.normalise({10, 10})
      {0.7071067811865475, 0.7071067811865475}
  """
  @spec normalise(v :: vector()) :: vector()
  def normalise({x, y} = _v) do
    l = len({x, y})
    {x / l, y / l}
  end

  @doc """
  Get the dot product of two vectors.

  ## Params

  * `v1` a `t:vector/0` describing the first vector.
  * `v2` a `t:vector/0` describing the second vector.

  Returns the dot product of `v1` and `v2`.

  ## Examples
      iex> Vector.dot({1, 2}, {3, 4})
      11
  """
  @spec dot(v1 :: vector(), v2 :: vector()) :: float()
  def dot({ax, ay} = _v1, {bx, by} = _v2) do
    ax * bx + ay * by
  end

  @doc """
  Get the cross product of two vectors.

  ## Params

  * `v1` a `t:vector/0` describing the first vector.
  * `v2` a `t:vector/0` describing the second vector.

  Returns the cross product of `v1` and `v2`.

  ## Examples
      iex> Vector.cross({1, 2}, {3, 4})
      -2
  """
  @spec cross(v1 :: vector(), v2 :: vector()) :: float()
  def cross({ax, ay} = _v1, {bx, by} = _v2) do
    ax * by - ay * bx
  end

  @doc """
  Get the magnitude of a vector, aka len.

  This is an alias for `len/2`.

  ## Examples
      iex> Vector.mag({1, 1})
      1.4142135623730951
      iex> Vector.mag({3, 4})
      5.0
      iex> Vector.mag({12, 5})
      13.0
  """
  @spec mag(v :: vector()) :: float()
  def mag(v), do: len(v)

  @doc """
  Get the angle of a vector in radians.

  ## Params

  * `v` a `t:vector/0` describing the vector to normalise.

  Returns the angle in radians in relationship to the x-axis.

  ## Examples
      iex> Vector.angle({1, 1})
      0.7853981633974483
      iex> Vector.angle({0, 1})
      1.5707963267948966
      iex> Vector.angle({1, 0})
      0.0
      iex> Vector.angle({-1, 1})
      2.356194490192345
      iex> Vector.angle({-1, 0})
      3.141592653589793
      iex> Vector.angle({-1, -1})
      3.9269908169872414
      iex> Vector.angle({0, -1})
      4.71238898038469
      iex> Vector.angle({1, -1})
      5.497787143782138
  """
  @spec angle(v :: vector()) :: float()
  def angle({x, y} = _v) when x < 0 and y < 0 do
    :math.pi() + angle({-x, -y})
  end

  def angle({x, y} = _v) when x < 0 do
    :math.pi() - angle({-x, y})
  end

  def angle({x, y} = _v) when y < 0 do
    2 * :math.pi() - angle({x, -y})
  end

  def angle({0.0, _y} = _v) do
    :math.pi() / 2
  end

  def angle({0, _y} = _v) do
    :math.pi() / 2
  end

  def angle({x, y} = _v) do
    # East-Counterclockwise Convention
    :math.atan(y / x)
  end

  @doc """
  Calls round on a vector to make a vector with `t:integer/0` instead of `t:float/0`.

  This is for interoperability with other libraries where coordinates must be
  expressed in integers, for example
  [`:wx`](https://www.erlang.org/doc/man/wx.html).

  The name ends in `_pos` to avoid any confusion/collision with `Kernel.trunc/1`.

  ## Params

  * `v` a `t:vector/0` describing the vector.

  Returns the vector with it's components converted to integers using `Kernel.trunc/1`.

  ## Examples
      iex> Vector.trunc_pos({10.1, 10.9})
      {10, 10}
  """
  @spec trunc_pos(v :: vector()) :: { integer(), integer() }
  def trunc_pos({x, y} = _v) do
    {Kernel.trunc(x), Kernel.trunc(y)}
  end

  @doc """
  Calls round on a vector to make a vector with `t:integer/0` instead of `t:float/0`.

  This is for interoperability with other libraries where coordinates must be
  expressed in integers, for example
  [`:wx`](https://www.erlang.org/doc/man/wx.html).

  The name ends in `_pos` to avoid any confusion/collision with `Kernel.round/1`.

  ## Params

  * `v` a `t:vector/0` describing the vector.

  Returns a vector with it's components converted to integers using `Kernel.round/1`.

  ## Examples
      iex> Vector.round_pos({10.1, 10.9})
      {10, 11}
  """
  @spec round_pos(v :: vector()) :: { integer(), integer() }
  def round_pos({x, y} = _v) do
    {Kernel.round(x), Kernel.round(y)}
  end

  @doc """
  This is a graph oriented degree.

  Graph degrees are oriented as for a graph layout.

  * Right (along the x-axis) is 0°
  * Up (along y-axis) is 90°,
  * 45° is "north-east / up and to the left".

  ## Params

  * `v` a `t:vector/0` describing the vector.

  Returns the vector in degrees relative to the x-axis.

  ## Examples
      iex> Vector.degrees_graph({1, 1})
      45.0
      iex> Vector.degrees_graph({0, 1})
      90.0
      iex> Vector.degrees_graph({1, 0})
      0.0
      iex> Vector.degrees_graph({-1, 1})
      135.0
      iex> Vector.degrees_graph({-1, 0})
      180.0
      iex> Vector.degrees_graph({-1, -1})
      225.0
      iex> Vector.degrees_graph({0, -1})
      270.0
      iex> Vector.degrees_graph({1, -1})
      315.0
  """
  @spec degrees_graph(v :: vector()) :: float()
  def degrees_graph({_x, _y} = v) do
    angle(v) * (180 / :math.pi())
  end

  @doc """
  This is a screen oriented degree.

  Screen degrees are in
  * North=up (0)
  * South=down (180) degrees.

  Vectors are in `(x,y)` screen coordinate, so `(1,1)` = 135 degrees (down to the
  right/ south-east) from `0,0`, the top left corner is `0,0`.

  ## Params

  * `v` a `t:vector/0` of coordinates describing the vector.

  Returns the vector in degrees relative to the y-axis.

  ## Examples
      iex> Vector.degrees({0, -1})
      0
      iex> Vector.degrees({1, -1})
      45
      iex> Vector.degrees({1, 0})
      90
      iex> Vector.degrees({1, 1})
      135
      iex> Vector.degrees({0, 1})
      180
      iex> Vector.degrees({-1, 1})
      225
      iex> Vector.degrees({-1, 0})
      270
      iex> Vector.degrees({-1, -1})
      315
  """
  @spec degrees(v :: vector()) :: integer()
  def degrees({x, _y} = v) do
    # z is our "north" and it's pointing "right" to rotate.
    z = {0, -1}
    d = dot(v, z)
    cos_a = d / (len(v) * len(z))
    d = :math.acos(cos_a) * (180 / :math.pi())

    if x < 0 do
      360 - d
    else
      d
    end
    |> Kernel.round
  end
end
