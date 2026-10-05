defmodule Scurry.AstarTest do
  use ExUnit.Case, async: true

  alias Scurry.Astar
  doctest Astar

  ##############################################################################
  # This test uses the graph and values from
  # https://www.101computing.net/a-star-search-algorithm/

  # Function to return the test graph. Note that nodes can be any term that can
  # be used as a key. While AstarWx uses {x, y} coordinates, strings are fine
  # too.
  def graph_101() do
    %{
      "a" => [
        {"b", 4},
        {"c", 3}
      ],
      "b" => [
        {"f", 5},
        {"e", 12}
      ],
      "c" => [
        {"e", 10},
        {"d", 7}
      ],
      "d" => [
        {"e", 2}
      ],
      "e" => [
        {"z", 5}
      ],
      "f" => [
        {"z", 16}
      ]
    }
  end

  # Function that computes the heuristic from `node, node :: cost`.
  def heur_101(from, to) do
    %{
      "a" => %{"z" => 14},
      "b" => %{"z" => 12},
      "c" => %{"z" => 11},
      "d" => %{"z" => 6},
      "e" => %{"z" => 4},
      "f" => %{"z" => 11},
      "z" => %{"z" => 0}
    }[from][to]
  end

  test "a-star 101" do
    state = Astar.search(graph_101(), "a", "z", &heur_101/2)
    path = Astar.path(state)
    assert path == ["a", "c", "d", "e", "z"]
  end

  test "a-star start equals stop" do
    state = Astar.search(graph_101(), "a", "a", &heur_101/2)
    path = Astar.path(state)
    assert path == ["a"]
  end

  ##############################################################################
  # This is a version of 101 that includes a loop back to start (a)
  def graph_101_loops() do
    %{
      "a" => [
        {"b", 4},
        {"c", 3},
        {"a", 1}
      ],
      "b" => [
        {"f", 5},
        {"e", 12}
      ],
      "c" => [
        {"e", 10},
        {"d", 7}
      ],
      "d" => [
        {"e", 2},
        {"a", 1}
      ],
      "e" => [
        {"z", 5},
        {"a", 1}
      ],
      "f" => [
        {"z", 16}
      ],
      "z" => [
        {"a", 1}
      ]
    }
  end

  test "a-star loop" do
    state = Astar.search(graph_101_loops(), "a", "z", &heur_101/2)
    path = Astar.path(state)
    assert path == ["a", "c", "d", "e", "z"]
  end

  test "a-star stop early" do
    # Add a cheap route from a->z
    graph = graph_101()
    a_edges = graph["a"]
    graph = Map.replace(graph, "a", a_edges ++ [{"z", 4}])

    state = Astar.search(graph, "a", "z", &heur_101/2)
    path = Astar.path(state)
    assert path == ["a", "z"]
    # Assert we don't explore too far
    assert Enum.sort(Map.keys(state.g_cost)) == ["b", "c", "z"]
  end

  ##############################################################################
  # Sanity checks that even if stop is reachable early but costlier, we find a
  # cheaper but longer path.
  def graph_long_way() do
    %{
      "a" => [
        {"b", 1},
        {"z", 10}
      ],
      "b" => [
        {"c", 1}
      ],
      "c" => [
        {"d", 1}
      ],
      "d" => [
        {"e", 1}
      ],
      "e" => [
        {"f", 1}
      ],
      "f" => [
        {"z", 1}
      ]
    }
  end

  # Function that computes the heuristic from `node, node :: cost`.
  def heur_long_way(from, to) do
    %{
      "a" => %{"z" => 6},
      "b" => %{"z" => 5},
      "c" => %{"z" => 4},
      "d" => %{"z" => 3},
      "e" => %{"z" => 2},
      "f" => %{"z" => 1},
      "z" => %{"z" => 0}
    }[from][to]
  end

  test "a-star long way" do
    state = Astar.search(graph_long_way(), "a", "z", &heur_long_way/2)
    path = Astar.path(state)
    assert path == ["a", "b", "c", "d", "e", "f", "z"]
  end


  ##############################################################################
  # Test trying to find an unreachable node.
  # Define a graph with a->b.
  def graph_dead_end() do
    %{
      "a" => [{"b", 1}],
      "b" => []
    }
  end

  # heur doesn't matter
  def heur_dead_end(_from, _to), do: 0

  test "a-star unreachable stop" do
    # "z" isn't in the graph at all, so search/4 never visits it. path/1 used
    # to mistake that for "z" being the start (shortest_path_tree[stop]
    # defaults to nil either way) and silently return the bogus one-node
    # path ["z"]. It should instead report that stop was never reached.
    state = Astar.search(graph_dead_end(), "a", "z", &heur_dead_end/2)
    path = Astar.path(state)
    assert path == nil
  end

  test "a-star unreachable stop that's in the graph but has no edges" do
    # Unlike graph_dead_end/0 above, "z" is present in the graph here (eg.
    # as PolygonMap.extend_graph/6 would add it), just with no edges in
    # either direction, so it can never be added to the frontier.
    graph = Map.put(graph_dead_end(), "z", [])
    state = Astar.search(graph, "a", "z", &heur_dead_end/2)
    path = Astar.path(state)
    assert path == nil
  end
end
