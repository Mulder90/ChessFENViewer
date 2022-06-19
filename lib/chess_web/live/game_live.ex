defmodule ChessWeb.GameLive do
  use ChessWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :state, %Chess.State{})}
  end

  def get_tile_state(_fen, _file, _rank) do
    "P"
  end
end
