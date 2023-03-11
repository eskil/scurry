defmodule ScurryTest do
  use ExUnit.Case
  doctest Scurry

  test "greets the world" do
    assert Scurry.hello() == :world
  end
end
