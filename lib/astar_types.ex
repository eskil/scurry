defmodule Scurry.Astar.Types do
  @moduledoc false

  defmacro __using__(_opts) do
    quote do
      @typedoc "The cost of a traversel between two nodes is a numeric value"
      @type cost :: number()

      @typedoc "A graph node (spelled `gnode` since `node` is reserved) is any type that can be used as a key in a `t:map/0` For instance a `t:vector/0`."
      @type gnode :: any()

      @typedoc "A graph is a map from `t:gnode/0` to a list of `t:gnode/0` and the traversal `t:cost/0`, `%{gnode => [{gnode, cost}, ...]}`"
      @type graph :: %{gnode() => {gnode(), cost()}}

      @typedoc "Function that given two `t:gnode/0` graph nodes, computes the cost. Eg. a euclidian 2D vector function like `Scurry.Vector.distance/2`. `(gnode, gnode -> cost)`"

      @type cost_fun :: (gnode(), gnode() -> cost())
    end
  end
end
