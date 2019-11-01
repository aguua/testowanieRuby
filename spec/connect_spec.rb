require 'connect'
RSpec.describe Board do
  it("an empty board has no winner") do
    board = [". . . . .", " . . . . .", "  . . . . .", "   . . . . .", "    . . . . ."].map do |row|
      row.gsub(/^ */, "")
    end
    game = Board.new(board)
    expect(game.winner).to(eq(""))
  end
  it("x can win on a 1x1 board") do
    board = ["X"].map { |row| row.gsub(/^ */, "") }
    game = Board.new(board)
    expect(game.winner).to(eq("X"))
  end
  it("o can win on a 1x1 board") do
    board = ["O"].map { |row| row.gsub(/^ */, "") }
    game = Board.new(board)
    expect(game.winner).to(eq("O"))
  end
  it("only edges does not make a winner") do
    board = ["O O O X", " X . . X", "  X . . X", "   X O O O"].map do |row|
      row.gsub(/^ */, "")
    end
    game = Board.new(board)
    expect(game.winner).to(eq(""))
  end
  it("illegal diagonal does not make a winner") do
    board = ["X O . .", " O X X X", "  O X O .", "   . O X .", "    X X O O"].map do |row|
      row.gsub(/^ */, "")
    end
    game = Board.new(board)
    expect(game.winner).to(eq(""))
  end
  it("nobody wins crossing adjacent angles") do
    board = ["X . . .", " . X O .", "  O . X O", "   . O . X", "    . . O ."].map do |row|
      row.gsub(/^ */, "")
    end
    game = Board.new(board)
    expect(game.winner).to(eq(""))
  end
  it("x wins crossing from left to right") do
    board = [". O . .", " O X X X", "  O X O .", "   X X O X", "    . O X ."].map do |row|
      row.gsub(/^ */, "")
    end
    game = Board.new(board)
    expect(game.winner).to(eq("X"))
  end
  it("o wins crossing from top to bottom") do
    board = [". O . .", " O X X X", "  O O O .", "   X X O X", "    . O X ."].map do |row|
      row.gsub(/^ */, "")
    end
    game = Board.new(board)
    expect(game.winner).to(eq("O"))
  end
  it("x wins using a convoluted path") do
    board = [". X X . .", " X . X . X", "  . X . X .", "   . X X . .", "    O O O O O"].map do |row|
      row.gsub(/^ */, "")
    end
    game = Board.new(board)
    expect(game.winner).to(eq("X"))
  end
  it("x wins using a spiral path") do
    board = ["O X X X X X X X X", " O X O O O O O O O", "  O X O X X X X X O", "   O X O X O O O X O", "    O X O X X X O X O", "     O X O O O X O X O", "      O X X X X X O X O", "       O O O O O O O X O", "        X X X X X X X X O"].map do |row|
      row.gsub(/^ */, "")
    end
    game = Board.new(board)
    expect(game.winner).to(eq("X"))
  end
end
