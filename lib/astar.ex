defmodule Astar do
  @moduledoc """

  Implementation of [A-star search
  algorithm](https://en.wikipedia.org/wiki/A*_search_algorithm) to find the
  shortest path in 2D polygon maps.

  The basic usage is;

  ```
  # computes the heuristic cost between two nodes
  def heur_fun(node_a, node_b) do
    ...
  end

  # Define a graph
  graph = %{
    node_1 => [
    {node_2, cost_1_2}, {node_3, cost_1_3},
    ],
    node_2 => [
      {node_3, cost_2_3}, {node_4, cost_2_4},
    ],
    ...
  }

  # Do A-star search
  state = Astar.search(graph, node_1, node_z, &heur_fun/2)

  # Extract path
  path = Astart.path(state)
  [node1, ..., node_z]
  ```
  """

  @doc """
  Find shortest path in `graph` from `start` to `stop`.

  ## Params

  * `graph` a map of node to a list of nodes and cost tuples.
  * `start` the node from which to start
  * `stop` the node at which to end
  * `heur_fun` the heuristic function used to estimate cost from a node in
    `graph` to `stop`. It takes two nodes and returns a cost that should be
    comparable with itself for ordering. `node, node :: term`.

  Returns the algorithms internal state which can be passed to `path/1` to
  obtain the actual path.
  """

  require Logger

  def search(graph, start, stop, heur_fun) do
    # Logger.info("----------------------------------------- A-star")
    # Logger.info("graph = #{inspect graph, pretty: true}")
    queue = [start]
    %{
      start: start,
      stop: stop,
      graph: graph,

      # (node, node) :: cost function
      heur_fun: heur_fun,

      queue: queue,
      shortest_path_tree: %{},
      frontier: %{},

      # node => cost - distance from start to node
      g_cost: %{},
      # vertice => cost, distance from start to vervice + heuristic distance to stop
      f_cost: %{}
    }
    |> pathfind_helper
  end

  defp sort_queue(queue, f_cost) do
    Enum.sort_by(queue, fn e -> Map.get(f_cost, e) end, :asc)
  end

  defp add_to_queue(queue, node) do
    Enum.sort(queue ++ [node])
    |> Enum.dedup
  end

  defp pathfind_helper(%{queue: []}=state) do
    state
  end

  defp pathfind_helper(%{queue: [current|queue]}=state) do
    # Logger.info("----------------------------------------- A-star search")
    # Logger.info("current = #{inspect current, pretty: true}")
    # Logger.info("state = #{inspect Map.delete(state, :graph), pretty: true}")

    spt = Map.put(state.shortest_path_tree, current, Map.get(state.frontier, current))

    cond do
      current == state.stop ->
        %{state | shortest_path_tree: spt}
      true ->
        edges = Map.get(state.graph, current, [])

        # Logger.info("edges = #{inspect edges, pretty: true}")

        reduce_seed = {state.frontier, queue, state.g_cost, state.f_cost}

        {f, q, g_cost, f_cost} =
          Enum.reduce(edges, reduce_seed, fn {node, edge_cost}, acc ->
            {frontier, queue, g_cost, f_cost} = acc
            # H cost
            heur_cost = state.heur_fun.(node, state.stop)
            # G cost
            shortest_distance_from_start = Map.get(g_cost, current, 0) + edge_cost
            # F cost = G cost + H cost
            total_distance = shortest_distance_from_start + heur_cost
            # Logger.info("\t#{inspect node} heur_cost = #{heur_cost}")
            # Logger.info("\t#{inspect node} new g_cost = #{shortest_distance_from_start}")
            # Logger.info("\t#{inspect node} new cost = #{total_distance}\n")

            cond do
              node == state.start ->
                # No reason to go back
                # Logger.info("skip going back to start")
                acc
              not Map.has_key?(frontier, node) ->
                {
                  Map.put(frontier, node, current),
                  add_to_queue(queue, node),
                  Map.put(g_cost, node, shortest_distance_from_start),
                  Map.put(f_cost, node, total_distance),
                }
              shortest_distance_from_start < Map.get(g_cost, node, 0) and Map.get(spt, node) == nil ->
                {
                  Map.put(frontier, node, current),
                  queue,
                  Map.put(g_cost, node, shortest_distance_from_start),
                  Map.put(f_cost, node, total_distance),
                }
              true ->
                {frontier, queue, g_cost, f_cost}
            end
          end)

        new_state = %{
          state |
          queue: sort_queue(q, f_cost),
          frontier: f,
          f_cost: f_cost,
          g_cost: g_cost,
          shortest_path_tree: spt,
        }

      pathfind_helper(new_state)
    end
  end

  @doc """
  Get the path from the state returned by `search/4`.

  ## Params

  * `state` the a-star state returned by `search/4`

  Returns the path.
  """
  def path(state) do
    next = state.shortest_path_tree[state.stop]
    path(state, state.start, next, [state.stop])
    |> Enum.reverse
  end

  defp path(_state, _start, nil, acc) do
    acc
  end

  defp path(_state, start, start, acc) do
    acc ++ [start]
  end

  defp path(state, start, node, acc) do
    next = state.shortest_path_tree[node]
    path(state, start, next, acc ++ [node])
  end
end
