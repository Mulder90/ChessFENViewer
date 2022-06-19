defmodule Chess.State do
  defstruct board: Enum.map(1..8, fn _ -> Enum.map(1..8, fn _ -> nil end) end), current: :white
end
