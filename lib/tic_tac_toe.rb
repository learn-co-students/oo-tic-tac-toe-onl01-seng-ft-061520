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
    [6,4,2]
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
  
  def move(location, player = "X")
    @board[location] = player
  end

  def position_taken?(index_i)
    ((@board[index_i] == "X") || (@board[index_i] == "O"))
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count{|player| player == "X" || player == "O"}
	end 
	
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end


  def turn
    puts "Please enter a number between 1-9."
    input = gets.strip # getting string from user 
    index = input_to_index(input) # converting user input 
    if valid_move?(index) # checking if user input is valid
      # user makes placement on the board 
      move(index, current_player)  
    else
      
  end 
end
end 