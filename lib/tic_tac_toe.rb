class TicTacToe
  
  def initialize(board = nil)
    @board = board ||Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, token= "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    (@board[index] == "X") || (@board[index] == "O")
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please choose a number between 1 and 9."
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    turns_taken = 0
    @board.each do |space|
      if space == "X" || space == "O"
        turns_taken += 1
      end
    end
    turns_taken
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def won?
  WIN_COMBINATIONS.detect do |winning_combo|
    if (@board[winning_combo[0]]) == "X" && (@board[winning_combo[1]]) == "X" && (@board[winning_combo[2]]) == "X"
      return winning_combo
    elsif (@board[winning_combo[0]]) == "O" && (@board[winning_combo[1]]) == "O" && (@board[winning_combo[2]]) == "O"
      return winning_combo
    else
      nil
    end
   end
  end
  
  def full?
    @board.all? do |token|
      token == "X" || token == "O"
    end
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end