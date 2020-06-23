  class TicTacToe 
    
    def initialize
      @board = Array.new(9, " ")
    
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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} | "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} | "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} | "

  end

  def input_to_index(user_input)
    user_input.to_i - 1
    end
  end 
  
  def move(board, index, user)
    board[index] = user
   
  end 
  
#   def position_taken?(board, index)
#     board[index] == "X" || board[index] == "O"
    
#   end 
  
#   def valid_move?(board, index)
#     index.between?(0,8) && !position_taken?(board, index)
    
#   end 
  
#   def turn(board)
#     puts "Please enter 1-9"
#       userInput = gets.strip 
#       index = input_to_index(userInput)
#       if !valid_move?(board_index)
      
#       else
#         move(board, index, current_user(board))
#   end 
# end 

#   def turn_count(board)
#     count = 0
#     board.each do |index|
#       if index != " "
#         count += 1 
     
#       end 
#     end 
#       count 
      
#     end 
    
#   def current_player(board)
#     if turn_count(board) % 2 == 0 
#       return "X"
#     else 
#       return "O"
#     end
    
#   end 
  
#   def won?(board)
#     win_conditions.each do |win|
#       if win.all?{|y| board|y| == "X"}
#         return win 
#       elsif win.all?{|y| board|y| == "O"}
#         return win 
#       end 
      
#     end 