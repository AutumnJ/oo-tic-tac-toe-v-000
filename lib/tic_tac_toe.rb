class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index
    @index = gets.strip.to_i - 1
  end

  def move=(index, token = "X")
    @board[@index] = token
  end

  def position_taken?
    return !(@board[@index] == " " || @board[@index] == "" || @board[@index] == nil)
  end

  def valid_move?
    if position_taken? == true || @index < 0 || @index > 8
      return false
    else
      return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    #input = gets.strip
    #index = input_to_index(input)
    if valid_move?
      move
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_array|
      if @board[win_array[0]] == "X" && @board[win_array[1]] == "X" && @board[win_array[2]] == "X" ||
        @board[win_array[0]] == "O" && @board[win_array[1]] == "O" && @board[win_array[2]] == "O"
      @winning_array = win_array
      end
    end
    false
  end

  def full?
    @board.all? {|index| index == "X" || index == "O" }
  end

  def draw?
    if full? == true && won? == false
      return true
    else
      return false
    end
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      @winner = @board[@winning_array[0]]
    else
      nil
    end
  end

end
