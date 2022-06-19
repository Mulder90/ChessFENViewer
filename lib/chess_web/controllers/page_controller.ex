defmodule ChessWeb.PageController do
  use ChessWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
