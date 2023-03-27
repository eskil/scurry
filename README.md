Scurry
======
[![GitHub CI](https://github.com/eskil/scurry/actions/workflows/elixir.yml/badge.svg)](https://github.com/eskil/scurry/actions/workflows/elixir.yml)
[![Coverage Status](https://coveralls.io/repos/github/eskil/scurry/badge.svg?branch=main)](https://coveralls.io/github/eskil/scurry?branch=main)
[![Last Updated](https://img.shields.io/github/last-commit/eskil/scurry.svg)](https://github.com/eskil/scurry/commits/master)
[![Hex.pm Version](https://img.shields.io/hexpm/v/scurry.svg?style=flat-square)](https://hex.pm/packages/scurry)

An
[A-star 2D polygon map search](https://en.wikipedia.org/wiki/A*_search_algorithm)
implementation and set of polygon, geometry and vector utility
functions for Elixir.

## Quickstart

See the [quickstart](Quickstart.md) or [hex.pm docs](https://hexdocs.pm/scurry).


## Wx Demo

Start a wxwidgets demo of a-star by running `Scurry.Wx.start()`;

```
$ mix deps.get
$ mix compile
$ iex -S mix
Erlang/OTP 25 [erts-13.1.3] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit:ns] [dtrace]

Interactive Elixir (1.14.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Scurry.Wx.start()
```

![animated gif showing demo](imgs/a-star-sample.gif?raw=true "A-star demo")

* The start point is a *green crosshair*.
* The cursor position is a *red crosshair* if inside the main polution, *gray* if outside.
* Moving the mouse will show a line from start to the cursor.
  * It'll be *green* if the there's a line of sight.
  * It'll be *gray* if not, and there'll be a *small red crosshair* at
    the first blockage, and *small gray crosshair* all subsequent
    blocks.
* Holding down left mouse button will show full search graph in
  *bright orange* and a *thick green path* for the found path.
* Releasing the left mouse button resets the start to there.
  * You can place the start outside the main polygon.


## How to use

Adding `scurry` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:scurry, "~> 1.0"},
  ]
end
```

Then, update your dependencies:

```sh-session
$ mix deps.get
```

## Internals

There's better API documentation than this see [the hexdocs](https://hexdocs.pm/scurry).

```
mix docs
open doc/index.html
```

### Vectors

In `lib/vector.ex` you'll find the basic vector operations (dot,
cross, length, add/sub) needed. A vector is a tuple of numbers, `{x, y}`.

### Lines

A line is a tuple of vectors, `{{x1, y1}, {x2, y2}}`.

### Polygon

In `lib/plygon.ex` you'll find the various polygon related functions,
such as line of sight, nearest point, convex etc.

A polygon is a list of vertices (nodes) that are `{x, y}` tuples that
represent screen coordinates.

In elixir, it looks like

```elixir
polygon = [{x, y}, {x, y}, ...]
```

The screen coordinate `0, 0` is upper left the x-axis goes
left-to-right and y-axis top-to-bottom. Polygons must be defined
clockwise and not-closed. This is important for convex/concave vertex
checks.

### Polygon map

The wxwidgets demo map is loaded from a [json file](priv/complex.json), and looks like

```json
{
  "polygons": [
    "main": [
      [x, y], [x, y], [x,y], ...
    ],
    "hole1": [
      [x, y], [x, y], [x,y], ...
    ],
    "hole2": [
      [x, y], [x, y], [x,y], ...
    ]
  ]
}
```

The `main` polygon is the primary walking area - as complex as it
needs to be.

Subsequent polygons (not named `main`) are holes within it.

Polygons don't need to be closed (last `[x, y]` equals the first),
this will be handled internally.

The polygon name isn't used internally, only to decide which polygon
is the primary boundary and which are holes.

### Graph

The A-star graph doesn't need to be a polygon map. It just needs to be
map from `node` to a list of `{node, cost}` edges. Node just has to be
a term that elixir can use as a map key.

For the 2D map search, it is a map from `vertice` to a list of
`{vertice, cost}`. This is computed from the polygon map using a set
of vertices. This set is composed of;

* the main polygon's *concave*  (pointing into the world)
* the holes' *convex* (point out of the hole, into the world)

and `PolygonMap.get_vertices/2` creates this.

```elixir
vertices = [
  {x1, y1}=vertice1,
  {x2, y2}=vertice2,
  {x3, y3}=vertice3,
  ...
]
```

This is transformed to a graph (`PolygonMap.create_graph/4`) given the
polygon, holes, vertices (from above) and cost function.

Assuming a `cost_fun` that has type `vertice, vertice :: cost`, the graph looks like;

```elixir
graph = %{
  vertice1 => [
    vertice2, cost_fun(vertice1, vertice2),
    vertice3, cost_fun(vertice1, vertice3),
    vertice4, cost_fun(vertice1, vertice4),
  ],
  # When expressed as "vertice = {x, y}"
  {x1, x2} => [
    {{x2, y2}, cost_fun({x1, y2}, {x2, y2})},
    {{x3, y3}, cost_fun({x1, y2}, {x3, y3})},
    ...
  ],
  ...
}
```

Note: `create_graph` uses `PolygonMap.is_line_of_sight?/3` to
determine if two vertices should have an edge. This is currently not
configurable or passed as a function.

The default `cost_fun` and `heur_fun` is the euclidean distance been
the two points.

```elixir
cost_fun = fn a, b -> Vector.distance(a, b) end
```

### A-star

In the context of A-star, we use `node` instead of `vertice` since we're
describing graphs - not strictly polygons. In the example, each node
is a polygon vertice (ie. `{x, y}`).

A `node` is opaque to the algorithm, it just uses them as
keys for it's internal state maps and arguments to `heur_fun`.
indexes.

The A-star algorithm main call is `Astar.search/4` and takes.

* `graph` to search. The graph should be constructed as

```elixir
graph = %{
  node1 => [
    node2, cost_fun(node1, node2),
    node3, cost_fun(node1, node3),
    node4, cost_fun(node1, node4),
  ],
  # When expressed as "node = {x, y}"
  {x1, x2} => [
    {{x2, y2}, cost_fun({x1, y2}, {x2, y2})},
    {{x3, y3}, cost_fun({x1, y2}, {x3, y3})},
    ...
  ],
  ...
}
```

* `start` and `stop`, the nodes to find a path between.

* `heur_fun` function `node, node :: cost` computes the heuristic
  cost. The default is the euclidian distance.

```elixir
fn a, b -> Vector.distance(a, b) end
```

The state it maintains and returns

* `shortest_path_tree`, a map of edges, `node_a => node_b`,
  where `node_b` is the "previous" node from `node_a` that is
  the shortest path.

* `queue` priority queue / list `[node, node, ...]` sorted on
  the cost (see `f_cost` below) of the path from `start` to node to
  `stop`.

* `frontier` map of `node => node (prev)` that have been reached
  and edges yet to try and have been added to the `queue`. It's a map,
  so when we visit a node, we can add how we reached it to
  `shortest_path_tree`.

* `g_cost`, map `node => cost` with the minimal current cost from
  the `start` to `node`. Each iteration compare the current
  node's `g_cost` against the value in the map. If it's less, we've
  found a shorter path to this node and update the `g_cost` map.

* `f_cost`, map `node => cost` with the "total cost" of path from
  `start`, via node, to `stop`. This means the computed minimal
  cost from `start` to node (`g_cost`) plus the heuristic cost via
  `heur_fun`. This is used to reorder `queue`.

`shortest_path_tree` is the most relevant field, and can be converted
to a path using `Astar.path/1`.

Within `astar.ex`, there's two steps; search & getting the
path. `search` returns the full state, and `path` could be
extended to return the cost along the path if needed. It can fetch
this from `g_cost.`
