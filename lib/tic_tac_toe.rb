class TicTacToe
array = [ ]
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS =
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]

def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end


 def input_to_index(player1)
   player1.to_i - 1
 end

 def move(position, player1 ="X")
   @board[position]= player1
 end

def position_taken?(index_i)
  @board[index_i]== "O"|| @board[index_i] == "X"
end

def valid_move?(index_i)
index_i.between?(0,8) && !position_taken?(index_i)
end


def turn_count
    counter = 0
    @board.each do |i|
      if i == "X" || i == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please choose a number 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
      player_token = current_player
      move(index, player_token)
      display_board
    else
      turn
    end
  end

  def won?
    board_empty = @board.none? { |i| i == "X" || i = "O"}
    if board_empty
      false
    else
      WIN_COMBINATIONS.each do |combo|
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          return combo
        end
      end
      return false
  end
end

def full?

  return false
end

def full?
  @board.all? {|index| index == "X" || index == "O"}
end

def draw?
  if !won? && full?
    return true
  else
    return false
  end
end

def over?
  if won? || draw?
    return true
  else
    return false
  end
end

def winner
  index = []
  index = won?
  if index == false
    return nil
  else
    if @board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

def play
  until over? == true
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end









#The board has 9 empty squares => The board is an array of 9 empty strings
# There are 2 pieces of tokens — X and O => X and O
# There are only 2 players => What is a player/How do we define a player
# Players take turns playing => Define what a turn is; how will a player take turns playing?
# 1st turn — Player 1 …. and the cycle continues until a player wins or there’s a tie game => iterate the game playing where players take turns; a player can’t place a token on a square that’s already taken
# There are 8 winning combinations: Top row, Middle row, Bottom row, Left column, Middle column, Right column, Left diagonal, and Right diagonal => Define those combinations
# There’s a draw/tie when the entire board is filled with X’s and O’s but no winning combinations can be found => Define what a draw/tie is; define what a filled board is
