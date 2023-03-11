defmodule AstarTest do
  use ExUnit.Case, async: true

  doctest Astar

  # This test uses the graph and values from
  # https://www.101computing.net/a-star-search-algorithm/

  # Function to return the test graph. Note that nodes can be any term that can
  # be used as a key. While AstarWx uses {x, y} coordinates, strings are fine
  # too.
  def graph_101() do
    %{
      "a" => [
        {"b", 4}, {"c", 3},
      ],
      "b" => [
        {"f", 5}, {"e", 12},
      ],
      "c" => [
        {"e", 10}, {"d", 7},
      ],
      "d" => [
        {"e", 2},
      ],
      "e" => [
        {"z", 5},
      ],
      "f" => [
        {"z", 16},
      ],
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
      "z" => %{"z" => 0},
    }[from][to]
  end

  test "a-star 101" do
    state = Astar.search(graph_101(), "a", "z", &heur_101/2)
    path = Astar.path(state)
    assert path == ["a", "c", "d", "e", "z"]
  end

  def graph_101_loops() do
    %{
      "a" => [
        {"b", 4}, {"c", 3}, {"a", 1},
      ],
      "b" => [
        {"f", 5}, {"e", 12},
      ],
      "c" => [
        {"e", 10}, {"d", 7},
      ],
      "d" => [
        {"e", 2}, {"a", 1},
      ],
      "e" => [
        {"z", 5}, {"a", 1},
      ],
      "f" => [
        {"z", 16},
      ],
      "z" => [
        {"a", 1},
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

  def graph_long_way() do
    %{
      "a" => [
        {"b", 1}, {"z", 10},
      ],
      "b" => [
        {"c", 1},
      ],
      "c" => [
        {"d", 1},
      ],
      "d" => [
        {"e", 1},
      ],
      "e" => [
        {"f", 1},
      ],
      "f" => [
        {"z", 1},
      ],
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
      "z" => %{"z" => 0},
    }[from][to]
  end

  test "a-star long way" do
    state = Astar.search(graph_long_way(), "a", "z", &heur_long_way/2)
    path = Astar.path(state)
    assert path == ["a", "b", "c", "d", "e", "f", "z"]
  end
end
