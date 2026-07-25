defmodule Scurry.VectorTest do
  use ExUnit.Case, async: true

  alias Scurry.Vector
  doctest Vector

  ##
  ## Vector.angle
  ##

  test "angle with positive zero float x" do
    assert Vector.angle({0.0, 1}) == :math.pi() / 2
  end

  test "angle with negative zero float x" do
    assert Vector.angle({-0.0, 1}) == :math.pi() / 2
  end
end
