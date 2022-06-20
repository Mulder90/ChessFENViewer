defmodule ChessWeb.GameLive do
  use ChessWeb, :live_view

  @assets %{
    "r" => "r_b",
    "n" => "n_b",
    "b" => "b_b",
    "q" => "q_b",
    "k" => "k_b",
    "p" => "p_b",
    "R" => "r_w",
    "N" => "n_w",
    "B" => "b_w",
    "Q" => "q_w",
    "K" => "k_w",
    "P" => "p_w"
  }
  @fen "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :assets, @assets)}
  end

  defp parse_fen_elem(elem) do
    case Integer.parse(elem) do
      {num, ""} ->
        Stream.repeatedly(fn -> "*" end)
        |> Enum.take(num)

      :error ->
        elem
    end
  end

  defp explode_numbers(fen_rank) do
    fen_rank
    |> String.split("")
    |> Enum.map(fn elem -> parse_fen_elem(elem) end)
    |> Enum.join("")
  end

  def get_square(rank, file) do
    @fen
    |> String.split(:binary.compile_pattern(["/", " "]))
    |> Enum.at(rank)
    |> explode_numbers()
    |> String.at(file)
  end
end
