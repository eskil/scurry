defmodule Scurry.Wx do
  @moduledoc false

  require Logger

  alias Scurry.Vector
  alias Scurry.Polygon
  alias Scurry.PolygonMap
  alias Scurry.Astar
  alias Scurry.WxEnum

  @behaviour :wx_object
  @title "A-star Wx Demo"
  @width 640
  @height 500
  @size {@width, @height}

  def start() do
    start_link([])
  end

  def start_link(args) do
    :wx_object.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(_args) do
    Logger.info("starting")

    fps = Application.get_env(:scurry, :fps, 30)
    slice = trunc(1_000 / fps)

    # Setup window
    wx = :wx.new([{:debug, :verbose}, {:silent_start, false}])

    frame_id = System.unique_integer([:positive, :monotonic])
    frame = :wxFrame.new(wx, frame_id, @title, size: @size)
    :wxFrame.connect(frame, :size, [:callback])
    :wxFrame.connect(frame, :close_window)

    panel = :wxPanel.new(frame, size: @size)
    :wxPanel.connect(panel, :paint, [:callback])
    :wxPanel.connect(panel, :left_up)
    :wxPanel.connect(panel, :left_down)
    :wxPanel.connect(panel, :motion)
    :wxPanel.connect(panel, :enter_window)
    :wxPanel.connect(panel, :leave_window)

    sizer = :wxBoxSizer.new(WxEnum.wxVERTICAL)
    :wxSizer.add(sizer, panel, [proportion: 1, flag: WxEnum.wxSHAPED])
    :wxSizer.setMinSize(sizer, @size)
    :wxFrame.setSizerAndFit(frame, sizer)

    :wxFrame.show(frame)

    cursor = :wxCursor.new(WxEnum.wxCURSOR_BLANK)
    :wxWindow.setCursor(panel, cursor)

    # This is what we draw on.
    blitmap = :wxBitmap.new(@width, @height)
    memory_dc = :wxMemoryDC.new(blitmap)

    Logger.info("starting timer #{slice}ms")
    timer_ref = Process.send_after(self(), :tick, slice)

    {start, polygons} = load("complex")
    {polygon, holes} = classify_polygons(polygons)

    walk_vertices = PolygonMap.get_vertices(polygon, holes)
    walk_graph = PolygonMap.create_graph(polygon, holes, walk_vertices)

    Logger.info("walk graphs = #{inspect walk_graph, pretty: true}")

    state = %{
      wx_frame: frame,
      wx_panel: panel,
      wx_memory_dc: memory_dc,
      wx_sizer: sizer,

      updated_at: nil,

      timer_ref: timer_ref,
      slice: slice,

      # Start point to search from
      start: start,
      # Where the cursor is, also our stop point for saerch
      cursor: nil,

      polygon: polygon,
      holes: holes,

      # This is the list of fixed vertices (from the map) that we will draw
      fixed_walk_vertices: walk_vertices,

      # This is the fixed walk graph (from fixed_walk_vertices) that we'll
      # outline in red
      fixed_walk_graph: walk_graph,

      # This is the computed path we'll draw in green
      path: [],

      # This is the extended walk graph path we'll draw in orange while the
      # mouse is being pressed
      click_walk_graph: nil,
    }
    {frame, state}
  end

  ##
  ## Wx Async Events
  ##

  @impl true
  def handle_event({:wx, _, _, _, {:wxSize, :size, {w, h}=_size, _}}=event, state) do
    Logger.info("received size event: #{inspect(event)}")
    # {w, h} = wx_aspect_ratio({w, h}, 640 / 480)
    # Logger.info("size #{inspect size} = #{w} #{h}")
    # :wxEvent.skip(event)
    :wxFrame.layout(state.wx_frame)
    :wxPanel.setMinSize(state.wx_panel, {w, h})
    :wxFrame.fit(state.wx_frame)

    {:noreply, state}
  end

  @impl true
  def handle_event({:wx, _, _, _, {:wxClose, :close_window}}=event, state) do
    Logger.info("received close event: #{inspect(event)}")
    {:stop, :normal, state}
  end

  @impl true
  def handle_event({:wx, _id, _wx_ref, _something,
                    {:wxMouse, :enter_window,
                     x, y,
                     _left_down, _middle_down, _right_down,
                     _control_down, _shift_down, _alt_down, _meta_down,
                     _wheel_rotation, _wheel_delta, _lines_per_action}}=_event, state) do
    {:noreply, %{state | cursor: {x, y}}}
  end

  @impl true
  def handle_event({:wx, _id, _wx_ref, _something,
                    {:wxMouse, :leave_window,
                     _x, _y,
                     _left_down, _middle_down, _right_down,
                     _control_down, _shift_down, _alt_down, _meta_down,
                     _wheel_rotation, _wheel_delta, _lines_per_action}}=_event, state) do
    {:noreply, %{state | cursor: nil}}
  end

  @impl true
  def handle_event({:wx, _id, _wx_ref, _something,
                    {:wxMouse, :motion, x, y,
                     true, _middle_down, _right_down,
                     _control_down, _shift_down, _alt_down, _meta_down,
                     _wheel_rotation, _wheel_delta, _lines_per_action}}=_event, state
  ) do
    stop = {x, y}
    {graph, _vertices, path} = get_updated_graph_vertices_path(state.polygon, state.holes, state.fixed_walk_vertices, state.fixed_walk_graph, state.start, stop)

    {:noreply, %{
        state |
        click_walk_graph: graph,
        cursor: stop,
        path: path,
     }
    }
  end

  @impl true
  def handle_event({:wx, _id, _wx_ref, _something,
                    {:wxMouse, :motion, x, y,
                     _left_down, _middle_down, _right_down,
                     _control_down, _shift_down, _alt_down, _meta_down,
                     _wheel_rotation, _wheel_delta, _lines_per_action}}=_event, state) do
    {:noreply, %{state | cursor: {x, y}}}
  end

  @impl true
  def handle_event({:wx, _id, _wx_ref, _something,
                    {:wxMouse, :left_down,
                     x, y,
                     _left_down, _middle_down, _right_down,
                     _control_down, _shift_down, _alt_down, _meta_down,
                     _wheel_rotation, _wheel_delta, _lines_per_action}}=_event,
    state
  ) do
    Logger.info("click #{inspect {x, y}}")
    stop = {x, y}
    {graph, _vertices, path} = get_updated_graph_vertices_path(state.polygon, state.holes, state.fixed_walk_vertices, state.fixed_walk_graph, state.start, stop)

    {:noreply, %{
        state |
        click_walk_graph: graph,
        path: path,
     }
    }
  end

  @impl true
  def handle_event({:wx, _id, _wx_ref, _something,
                    {:wxMouse, :left_up,
                     x, y,
                     _left_up, _middle_down, _right_down,
                     _control_down, _shift_down, _alt_down, _meta_down,
                     _wheel_rotation, _wheel_delta, _lines_per_action}}=_event,
    state
  ) do
    Logger.info("click #{inspect {x, y}}")
    # Reset fields so we only show the debug graph
    {:noreply, %{
        state |
        click_walk_graph: nil,
        start: {x, y},
        path: [],
     }
    }
  end

  @impl true
  def handle_event({:wx, _, _, _, _} = event, state) do
    Logger.info("unhandled wx event #{inspect event, pretty: true}")
    {:noreply, state}
  end

  ##
  ## Wx Sync Events
  ##

  @impl true
  def handle_sync_event({:wx, _, _, _, {:wxSize, :size, _, _}}=_xevent, wxo, state) do
    :wxEvent.skip(wxo)
    :wxFrame.layout(state.wx_frame)
    panel_size = :wxPanel.getSize(state.wx_panel)
    :wxPanel.setMinSize(state.wx_panel, panel_size)
    :wxFrame.fit(state.wx_frame)

    :ok
  end

  @impl true
  def handle_sync_event({:wx, _, _, _, {:wxPaint, :paint}}=_event, _, state) do
    dc = state.wx_memory_dc
    wx_cls(dc)

    {w, _h} = :wxPanel.getSize(state.wx_panel)
    scale = w/ 640

    draw_polygons(dc, state)
    draw_a_b_line(dc, state)
    draw_cursors(dc, state)
    draw_walk_vertices(dc, state)
    draw_walk_graph(dc, state)
    draw_walk_path(dc, state)

    # Draw
    paint_dc = :wxPaintDC.new(state.wx_panel)
    :wxDC.setUserScale(paint_dc, scale, scale)
    :wxDC.blit(paint_dc, {0, 0}, @size, dc, {0, 0})
    :wxPaintDC.destroy(paint_dc)

    :ok
  end

  @impl true
  def handle_sync_event(event, _, _state) do
    Logger.info("received sync event: #{inspect event, pretty: true}")
    :ok
  end

  ##
  ## Ticks
  ##

  @impl true
  def handle_info(:tick, state) do
    # This is called at the configured frame rate, and updates state (nothing
    # in this example), rerenders the screen and schedules the timer for next
    # frame.
    {elapsed_usec, {:ok, new_state}} = :timer.tc(fn ->
      new_state = update(state)
      :ok = render(new_state)
      {:ok, new_state}
    end)
    pause = max(0, state[:slice] - trunc(elapsed_usec / 1_000))
    timer_ref = Process.send_after(self(), :tick, pause)
    {:noreply, %{new_state | timer_ref: timer_ref}}
  end

  @impl true
  def handle_info({:EXIT, _pid, reason}, _state) do
    Logger.info("A child process died: #{reason}")
  end

  @impl true
  def handle_info(msg, state) do
    Logger.error("received unexpected message: #{inspect(msg)}")
    {:noreply, state}
  end

  @impl true
  def terminate(reason, state) do
    Logger.info("Terminating, #{inspect reason}")
    stop(state)
    exit(reason)
  end

  ##
  ## Gfx Loop
  ##

  def update(state) do
    state
  end

  def render(state) do
    :wxPanel.refresh(state.wx_panel, eraseBackground: false)
  end

  def stop(_state) do
    Logger.info("stopping")
  end

  ##
  ## Render helper funtions
  ##

  def draw_cursors(_dc, %{cursor: nil}=_state) do
    :ok
  end

  def draw_cursors(dc, state) do
    light_gray = {211, 211, 211}
    bright_red = {255, 0, 0}
    bright_green = {0, 255, 0}

    # Draw start point bright green
    wx_crosshair(dc, state.start, bright_green, size: 6)

    # Draw stop (cursor) gray if inside hole (and inside main polygon), red
    # otherwise.
    if Polygon.is_inside?(state.polygon, state.cursor) do
      if Enum.any?(state.holes, &(Polygon.is_inside?(&1, state.cursor))) do
        wx_crosshair(dc, state.cursor, light_gray, size: 6)
      else
        wx_crosshair(dc, state.cursor, bright_red, size: 6)
      end
    else
      wx_crosshair(dc, state.cursor, light_gray, size: 6)
    end
  end

  def draw_polygons(dc, state) do
    blue = {0, 150, 255}
    opaque_blue = {0, 150, 255, 64}

    blue_pen = :wxPen.new(blue, [{:width,  1}, {:style, WxEnum.wxSOLID}])

    brush = :wxBrush.new({0, 0, 0}, [{:style, WxEnum.wxSOLID}])
    opaque_blue_brush = :wxBrush.new(opaque_blue, [{:style, WxEnum.wxSOLID}])

    :wxDC.setBrush(dc, opaque_blue_brush)
    :wxDC.setPen(dc, blue_pen)
    :ok = :wxDC.drawPolygon(dc, state.polygon)
    for point <- state.polygon do
      wx_crosshair(dc, point, blue)
    end

    :wxDC.setBrush(dc, brush)
    :wxDC.setPen(dc, blue_pen)
    for hole <- state.holes do
      :ok = :wxDC.drawPolygon(dc, hole)
      for point <- hole do
        wx_crosshair(dc, point, blue)
      end
    end

    :wxPen.destroy(blue_pen)
    :wxBrush.destroy(brush)
    :wxBrush.destroy(opaque_blue_brush)
  end

  def draw_walk_vertices(dc, state) do
    blue = {0, 150, 255}
    opaque_blue = {0, 150, 255, 64}

    blue_pen = :wxPen.new(blue, [{:width,  1}, {:style, WxEnum.wxSOLID}])
    brush = :wxBrush.new(opaque_blue, [{:style, WxEnum.wxSOLID}])

    :wxDC.setPen(dc, blue_pen)
    :wxDC.setBrush(dc, brush)

    for point <- state.fixed_walk_vertices do
      :wxDC.drawCircle(dc, point, 5)
    end

    :wxPen.destroy(blue_pen)
    :wxBrush.destroy(brush)
  end

  def draw_a_b_line(_dc, %{cursor: nil}=_state) do
    :ok
  end

  def draw_a_b_line(dc, state) do
    brush = :wxBrush.new({0, 0, 0}, [{:style, WxEnum.wxTRANSPARENT}])
    :wxDC.setBrush(dc, brush)

    light_gray = {211, 211, 211, 128}
    light_gray_pen = :wxPen.new(light_gray, [{:width,  1}, {:style, WxEnum.wxSOLID}])

    bright_green = {0, 255, 0}
    bright_green_pen = :wxPen.new(bright_green, [{:width,  1}, {:style, WxEnum.wxSOLID}])

    start = state.start
    stop = state.cursor
    line = {state.start, state.cursor}
    if PolygonMap.is_line_of_sight?(state.polygon, state.holes, line) do
      :wxDC.setPen(dc, bright_green_pen)
    else
      :wxDC.setPen(dc, light_gray_pen)
    end
    :ok = :wxDC.drawLine(dc, start, stop)

    intersections = for poly <- [state.polygon] ++ state.holes do
      Polygon.intersections(poly, line)
    end
    |> List.flatten
    |> Enum.sort(fn ia, ib ->
      v1 = Vector.sub(start, ia)
      v2 = Vector.sub(start, ib)
      # Sort closest to furthest
      Vector.distance(start, v1) > Vector.distance(start, v2)
    end)
    |> Enum.map(&(Vector.trunc_pos(&1)))

    for p <- intersections do
      wx_crosshair(dc, p, light_gray, size: 3)
    end

    case intersections do
      [] -> nil
      [p|_] -> wx_crosshair(dc, p, {255, 0, 0}, size: 3)
    end

    :wxPen.destroy(light_gray_pen)
    :wxPen.destroy(bright_green_pen)
    :wxBrush.destroy(brush)
  end

  def draw_walk_graph(dc, state) do
    light_red = {255, 0, 0, 64}
    bright_red = {255, 87, 51, 128}
    light_red_pen = :wxPen.new(light_red, [{:width,  1}, {:style, WxEnum.wxSOLID}])
    bright_red_pen = :wxPen.new(bright_red, [{:width,  1}, {:style, WxEnum.wxSOLID}])

    if state.click_walk_graph do
      :wxDC.setPen(dc, bright_red_pen)
      for {a, edges} <- state.click_walk_graph do
        for {b, _} <- edges do
          :ok = :wxDC.drawLine(dc, a, b)
        end
      end
    else
      :wxDC.setPen(dc, light_red_pen)
      for {a, edges} <- state.fixed_walk_graph do
        for {b, _} <- edges do
          :ok = :wxDC.drawLine(dc, a, b)
        end
      end
    end

    :wxPen.destroy(light_red_pen)
    :wxPen.destroy(bright_red_pen)
  end

  def draw_walk_path(dc, state) do
    bright_green_pen = :wxPen.new({64, 255, 64}, [{:width,  2}, {:style, WxEnum.wxSOLID}])
    :wxDC.setPen(dc, bright_green_pen)

    pointsets = Enum.chunk_every(state.path, 2, 1)
    Enum.map(pointsets, fn
      [a, b] ->
        :ok = :wxDC.drawLine(dc, a, b)
      _ ->
        :ok
    end)

    :wxPen.destroy(bright_green_pen)
  end

  # Convert time in microseconds to "pretty" time.
  defp usec_to_str(usec) when usec < 1_000 do
    "#{usec}µs"
  end

  defp usec_to_str(usec) when usec < 1_000_000 do
    "#{usec/1_000}ms"
  end

  defp usec_to_str(usec)  do
    "#{usec/1_000_000}s"
  end

  def get_updated_graph_vertices_path(polygon, holes, vertices, graph, start, stop) do
    # Determine the nearest point inside the polygon, in case the user clicked
    # outside the polygon.
    np = PolygonMap.nearest_point(polygon, holes, stop)

    # Extend the map to include start/stop (nearest)
    {graph_usec, {new_graph, new_vertices}} = :timer.tc(fn ->
      PolygonMap.extend_graph(graph, polygon, holes, vertices, [start, np])
    end)

    # Search the graph from start to np using euclidean distance heur_fun
    {astar_usec, path} = :timer.tc(fn ->
      astar = Astar.search(new_graph, start, np, fn a, b -> Vector.distance(a, b) end)
      Astar.path(astar)
    end)

    # Curtesy compute distance for the user
    distance =
      path
      |> Enum.chunk_every(2, 1)
      |> Enum.reduce(0, fn
        [a, b], acc -> acc + Vector.distance(a, b)
        _, acc -> acc
      end)

    Logger.info("graph extend = #{usec_to_str(graph_usec)} a-star = #{usec_to_str(astar_usec)} distance = #{:erlang.float_to_binary(distance, [decimals: 2])}")

    {new_graph, new_vertices, path}
  end

  ##
  ## WxWidgets helper methods to draw things
  ##

  @doc"""
  Draw a crosshair at the given `{x, y}` and with the given `color`

  Returns `:ok`

  ## Parameters
  * `dc`, a `wxDC` context to draw in
  * `pos`, a `{x, y}` coordinate to center the crosshair at
  * `color` a `{r, g, b}` colour value

  ## Options

  * `:width`, width of the pen. 1 is thin given the context, 2 is close to the
    pixel size.
  * `:size`, the length of each crosshair.
  """
  def wx_crosshair(dc, pos, color, options \\ []) do
    {x, y} = pos
    width = Keyword.get(options, :width, 1)
    size = Keyword.get(options, :size, 2)
    pen = :wxPen.new(color, [{:width,  width}, {:style, WxEnum.wxSOLID}])

    :wxDC.setPen(dc, pen)
    :ok = :wxDC.drawLine(dc, {x, y-size}, {x, y+size})
    :ok = :wxDC.drawLine(dc, {x-size, y}, {x+size, y})
    :wxPen.destroy(pen)
    :ok
  end

  def wx_cls(dc, color) do
    brush = :wxBrush.new(color, [{:style, WxEnum.wxSOLID}])
    :ok = :wxDC.setBackground(dc, brush)
    :ok = :wxDC.clear(dc)
    :wxBrush.destroy(brush)
  end

  def wx_cls(dc) do
    wx_cls(dc, {0, 0, 0})
  end

  def wx_aspect_ratio({w, h}=_size, ratio) do
    cond do
      w/h > ratio ->
        {w, round(w / ratio)}
      true ->
        {round(h * ratio), h}
    end
  end

  ##
  ## Helper methods to load json map
  ##

  # Transform a json `[x, y]` list to a `{x, y}` tuple and ensure it's a integer (trunc)
  defp transform_point([x, y]) do
    {round(x), round(y)}
  end

  # Transform a json polygon, `name, [[x, y], [x, y]...]` list to a `{name, [{x, y}, ...]}`.
  defp transform_walkbox({name, points}) do
    points = Enum.map(points, &(transform_point(&1)))
    {name, points}
  end

  defp transform_walkboxes(polygons) do
    polygons
    |> Enum.map(&(transform_walkbox(&1)))
  end

  # In case the json polygon is closed (last == first) point, drop the last
  # since we handle them as open.
  defp unclose_walkbox({name, points}) do
    if Enum.at(points, 0) == Enum.at(points, -1) do
      {name, Enum.drop(points, -1)}
    else
      {name, points}
    end
  end

  defp unclose_walkboxes(polygons) do
    polygons
    |> Enum.map(&(unclose_walkbox(&1)))
  end

  @doc """
  Helper to split polygons into the the main and the holes.

  ## Examples
  iex> classify_polygons([{:main, [{0, 0}, {10, 0}, {5, 5}]}, {:hole1, [{1, 1}, {9, 1}, {4, 5}]}])
  {[{0, 0}, {10, 0}, {5, 5}], [[{1, 1}, {9, 1}, {4, 5}]]}
  """
  def classify_polygons(polygons) do
    {mains, holes} = Enum.split_with(polygons, fn {name, _} -> name == :main end)
    holes = Enum.map(holes, fn {_name, polygon} -> polygon end)
    {mains[:main], holes}
  end

  # Quick and dirty "tap" function that'll crash earlyif any polygon isn't clockwise.
  defp check_clockwise(polygons) do
    true = Enum.all?(polygons, fn {_name, polygon} -> Polygon.is_clockwise?(polygon) end)
  end

  @doc """
  Load and prepare a a json file from `priv/`.

  Eg. `load("complex")` will load `priv/complex.json`.

  ## Examples
      iex> load("scene1")
      {{50, 50}, [hole: [{300, 200}, {400, 200}, {400, 300}, {300, 300}], main: [{40, 40}, {590, 40}, {590, 460}, {40, 460}]]}
  """
  def load(scene) do
    path = Application.app_dir(:scurry)
    filename = "#{path}/priv/#{scene}.json"
    {:ok, file} = File.read(filename)
    {:ok, json} = Poison.decode(file, keys: :atoms)

    polygons =
      json[:polygons]
      |> transform_walkboxes
      |> unclose_walkboxes
      |> tap(&check_clockwise/1)

    {
      transform_point(json[:start]),
      polygons,
    }
  end
end
