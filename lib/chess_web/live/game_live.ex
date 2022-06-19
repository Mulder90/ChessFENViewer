defmodule ChessWeb.GameLive do
  use ChessWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :state, %Chess.State{})}
  end
end
