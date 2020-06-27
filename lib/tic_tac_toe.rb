require 'pry'
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top Row
    [3,4,5], #Middle Row
    [6,7,8], #Bottom Row
    [0,3,6], #Vert Left
    [1,4,7], #Vert Center
    [2,5,8], #Vert Right
    [0,4,8], #Diag Down Right
    [2,4,6], #Diag Down Left
  ]
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i - 1
    index
  end
  
  def move(index, token="X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == " " ? false : true
  end
  
  def valid_move?(index)
    ans = false
    if 0 <= index && index < 9
      position_taken?(index) ? ans = false : ans = true
    end
    ans
  end
  
  def turn
    
    puts "Select a location!"
    
    
    moved = false
    while moved == false do 
      input = gets.strip
      index = input_to_index(input)
    
      if valid_move?(index)
        move(index, current_player)
        display_board
        moved = true
      else
        puts "Invalid location, please select again."
      end
    end
  end
  
  def won?
    x = []
    o = []
    
    @board.each_with_index do |cell, index| 
      if cell == "X"
        x << index
      elsif cell == "O"
        o << index
      end
    end  
    
    no_win = false
    
    WIN_COMBINATIONS.each do |combo|
      
      if x.include?(combo[0]) && x.include?(combo[1]) && x.include?(combo[2])
        return combo
      elsif o.include?(combo[0]) && o.include?(combo[1]) && o.include?(combo[2])
        return combo
      end
      
    end
    no_win
  end
  
  def full?
    !@board.include?(" ") ? true : false
  end
  
  def draw?
    full? && !won? ? true : false
  end
  
  def over?
    if won? || draw?
      true
    else
      false
    end
  end
  
  def winner
    if won? != false
      combo = won?
      number = combo[0]
      winner = @board[number]
      
      winner
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