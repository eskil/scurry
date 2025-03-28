defmodule Scurry.Types do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      @typedoc "A vector is represented as a tuple `{x, y}`, it's x and y components, both `t:number/0`. These are used for vector math in `Scurry.Vector` and as 2D points in `Scurry.Polygon` and `Scurry.PolygonMap`."
      @type vector() :: {x :: number(), y :: number()}

      @typedoc "A polygon is represented by a list of `t:vector/0`, each being a tuple of `{x, y}` coordinates, both `t:number/0`. To be properly defined, the vertices of the polygon must be non-closed and clockwise."
      @type polygon() :: list(vector())

      @typedoc "A line is represented by two vertices of type `t:vector/0`"
      @type line() :: {vector(), vector()}
    end
  end
end
