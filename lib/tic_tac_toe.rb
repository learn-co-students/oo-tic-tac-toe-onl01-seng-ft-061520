class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  
  end
  
   WIN_COMBINATIONS = [
     [0,1,2],
     [3,4,5],
     [6,7,8],
     [0,4,8],
     [2,4,6],
     [0,3,6],
     [1,4,7],
     [2,5,8]]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(string)
    string.to_i-1
  end
  
  def move(index,token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == " "
      return false 
    else 
      return true
    end
  end
  
  def valid_move?(index)
    if index < 9 && position_taken?(index) == false
      return true
    else 
      return false
    end
    #true if present on game board and not filled with token else false
  end
  
  def turn_count
    counter = 0 
    @board.each do |place| 
      if place == "X" || place == "O"
        counter +=1
      end
    end
    counter
  end
  
  def current_player
    if turn_count%2 ===1
      return "O"
    else return "X"
    end
  end
  
def turn
puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
      puts "Please enter 1-9:"
    end
end
end

#   def turn
#     puts "Please enter 1-9:"
#     input = gets.strip
#     index = input_to_index(input)
#     token = current_player
#     if valid_move?(index)
#       move(index,token)
#       display_board
#     else 
#       turn
#   end
# end
#   def turn
#     puts "Player #{current_player}, please enter a number 1-9:"
#     input = gets.strip
#     index = input_to_index(input)
#     cp = current_player
#     if valid_move?(index)
#       move(index, cp)
#       display_board
#     else
#       turn
#     end
#   end
# end