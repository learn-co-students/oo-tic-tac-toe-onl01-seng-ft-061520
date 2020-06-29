class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, current_player)
    @board[index] = current_player
  end
  def position_taken?(position)
    @board[position] != " " && @board[position] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |position|
      @board[position[0]] == @board[position[1]] && @board[position[1]] == @board[position[2]] && @board[position[2]] != " "
    end
  end
  
  def full?
    @board.include?("X" || "O")
    !@board.include?(" ")
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || full? || draw?
  end
  
  def winner
    if won? == nil || @board[won?.first] != "X" && @board[won?.first] != "O"
      nil
    elsif @board[won?.first] == "X"
      "X"
    else
      "O"
    end
  end
  def play
    turn until over?
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end
end
