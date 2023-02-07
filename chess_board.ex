defmodule ChessBoard do
  @board [
    {"R", "N", "B", "Q", "K", "B", "N", "R"},
    {"P", "P", "P", "P", "P", "P", "P", "P"},
    [" ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " "],
    {"p", "p", "p", "p", "p", "p", "p", "p"},
    {"r", "n", "b", "q", "k", "b", "n", "r"]
  ]

  def move_piece(from, to) do
    {from_row, from_column} = from
    {to_row, to_column} = to
    piece = @board[from_row][from_column]
    @board[from_row][from_column] = " "
    @board[to_row][to_column] = piece
  end

  def get_piece(position) do
    {row, column} = position
    @board[row][column]
  end

  def get_board do
    @board
  end
end
