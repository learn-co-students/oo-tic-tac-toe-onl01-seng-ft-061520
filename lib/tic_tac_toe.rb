require 'pry'
class TicTacToe
  #attr_accessor 
  
  def initialize(board = nil)  
   @board = board || Array.new(9, " ") 
  end 
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]
  
    
  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
   
  def input_to_index(string)
    string.to_i - 1
    #str.gsub("white", "dark")
  end 
   
  def move(index, token="X")
    
    @board[index] = token
  end 
  
  def position_taken?(user_move)
    if @board[user_move] == "X" || @board[user_move] == "O"  
      true 
    else 
      false 
    end 
  end 
  
  def valid_move?(position)
    #position_to_check = position.to_i - 1 #integer (-1)
    #binding.pry 
    if position.between?(0,8) && !position_taken?(position)
      true 
    else 
      false 
    end 
  end 
  
  # failed: @board[position_to_check] == @board[0..8] : position_to_check = -1, @board[0..8] returns """", etc 
  
  def turn 
    puts "your turn"
    input = gets.strip 
    index = input_to_index(input)
                                    #input -1 
                                      #gets will return terminal prompt message
                                    #gets.strip - will remove white space 
                                      #receive input - learn.co/lessons/ruby-gets-input 
    player = current_player
    if valid_move?(index)
      #put on board?? 
      move(index,player)
      display_board
    else 
      turn 
    end 
  end 
  
  def turn_count 
    @board.count{|token| token == "X" || token == "O" }
  end 
  
  def current_player 
    if turn_count%2 == 0 
      "X"
    else 
      "O"
      #even Xs, odds Os 
    end 
  end 
  
  def won?
    #win combination array  
    #return array with the winning combination 
    WIN_COMBINATIONS.detect do |winner| 
      if @board[winner[0]] == "X" &&  @board[winner[1]] == "X" && @board[winner[2]] == "X"
      return winner 
      elsif 
        @board[winner[0]] == "O" &&  @board[winner[1]] == "O" && @board[winner[2]] == "O"
        return winner 
      else 
        false 
    end 
    end 
  end 
  
  def full?
    @board.all? {|check| check == "X" || check == "O"}
  end 
  
  def draw?
    full? && !won? ? true : false 
    #ternary operator  ruby guides 
  end 
  
  def over?
    draw? || won? ? true : false 
  end 
  
  def winner
    WIN_COMBINATIONS.detect do |winner| 
      if @board[winner[0]] == "X" &&  @board[winner[1]] == "X" && @board[winner[2]] == "X"
      return "X" 
      elsif 
        @board[winner[0]] == "O" &&  @board[winner[1]] == "O" && @board[winner[2]] == "O"
        return "O" 
      else 
        nil 
    end 
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

