defmodule Game do
  use ChessBoard
  use ChessRules

  def start do
    board = create_board()
    play(board)
  end

  def play(board) do
    IO.puts("Current board:")
    display_board(board)

    IO.puts("Enter move (e.g. 'e2 e4'):")
    input = String.strip(IO.gets())
    [from, to] = String.split(input, " ")

    # Convert input to coordinates
    from = string_to_coord(from)
    to = string_to_coord(to)

    case get_piece(board, from) do
      nil -> IO.puts("Invalid move, try again")
             play(board)
      piece ->
        case validate_move(board, from, to, piece) do
          false -> IO.puts("Invalid move, try again")
                   play(board)
          true -> move_piece(board, from, to)
                  play(board)
        end
    end
  end

end


