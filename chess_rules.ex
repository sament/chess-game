defmodule ChessRules do
  import ChessBoard

  @valid_pieces ["R", "N", "B", "Q", "K", "P", "r", "n", "b", "q", "k", "p"]

  def validate_move(from, to) do
    piece = ChessBoard.get_piece(from)
    case piece do
      "R" -> validate_rook_move(from, to)
      "N" -> validate_knight_move(from, to)
      "B" -> validate_bishop_move(from, to)
      "Q" -> validate_queen_move(from, to)
      "K" -> validate_king_move(from, to)
      "P" -> validate_pawn_move(from, to)
      "r" -> validate_rook_move(from, to)
      "n" -> validate_knight_move(from, to)
      "b" -> validate_bishop_move(from, to)
      "q" -> validate_queen_move(from, to)
      "k" -> validate_king_move(from, to)
      "p" -> validate_pawn_move(from, to)
      _ -> false
    end
  end

  defp validate_rook_move(from, to) do
    # Rooks can only move vertically or horizontally, not diagonally
    from_col = elem(from, 0)
    from_row = elem(from, 1)
    to_col = elem(to, 0)
    to_row = elem(to, 1)

    if from_col == to_col || from_row == to_row, do: true, else: false
  end

   defp validate_knight_move(from, to) do
    # Knights move in an L-shape: two squares in one direction and then one square in a perpendicular direction
    from_col = elem(from, 0)
    from_row = elem(from, 1)
    to_col = elem(to, 0)
    to_row = elem(to, 1)

    diff_col = abs(from_col - to_col)
    diff_row = abs(from_row - to_row)

    if diff_col == 2 && diff_row == 1 || diff_col == 1 && diff_row == 2, do: true, else: false
  end

  defp validate_bishop_move(from, to) do
  # Bishops can only move diagonally
  from_col = elem(from, 0)
  from_row = elem(from, 1)
  to_col = elem(to, 0)
  to_row = elem(to, 1)

  diff_col = abs(from_col - to_col)
  diff_row = abs(from_row - to_row)

  if diff_col == diff_row, do: true, else: false
end


  defp validate_queen_move(from, to) do
  # Queens can move diagonally or straight
  from_col = elem(from, 0)
  from_row = elem(from, 1)
  to_col = elem(to, 0)
  to_row = elem(to, 1)

  diff_col = abs(from_col - to_col)
  diff_row = abs(from_row - to_row)

  if diff_col == diff_row || from_col == to_col || from_row == to_row, do: true, else: false
end


  defp validate_king_move(from, to) do
  # Kings can move one square in any direction
  from_col = elem(from, 0)
  from_row = elem(from, 1)
  to_col = elem(to, 0)
  to_row = elem(to, 1)

  diff_col = abs(from_col - to_col)
  diff_row = abs(from_row - to_row)

  if diff_col <= 1 && diff_row <= 1, do: true, else: false
end


  defp validate_pawn_move(from, to, color) do
  # Pawns move forward, capture diagonally
  from_col = elem(from, 0)
  from_row = elem(from, 1)
  to_col = elem(to, 0)
  to_row = elem(to, 1)

  diff_col = abs(from_col - to_col)
  diff_row = to_row - from_row

  case color do
    :white ->
      if diff_row == -1 && diff_col == 0, do: true,
      if diff_row == -1 && diff_col == 1, do: true,
      if diff_row == -2 && diff_col == 0 && from_row == 2, do: true,
      else: false
    :black ->
      if diff_row == 1 && diff_col == 0, do: true,
      if diff_row == 1 && diff_col == 1, do: true,
      if diff_row == 2 && diff_col == 0 && from_row == 7, do: true,
      else: false
  end
end

end
