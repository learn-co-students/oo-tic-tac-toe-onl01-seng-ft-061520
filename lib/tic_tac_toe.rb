require 'pry'


class TicTacToe
  
  WIN_COMBINATIONS = [
   
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
    
    ]
  
  def initialize
    @board = Array.new(9, " ")
  end 
  
  def display_board
    
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    
    puts "-----------"
    
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    
    puts "-----------"
    
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    
  end 
  
  def input_to_index(input)
    
    input.to_i-1
    
  end 
  
  
  def move(index, x = "X")
    @board[index] = x 
  end  
  
  def position_taken?(index)
    
    if @board[index] == nil || @board[index] == " "
      false 
    else 
      true 
    end
    
  end 
  
  def valid_move?(index)
    
    index.between?(0,8) && !position_taken?(index) 
    
  end 
  
  def turn_count
    
    turn = 0 
    
    @board.each do |i| 
      if i == "X" || i == "O" 
        turn += 1
      end 
    end 
    turn 
  end 
  
  def current_player
    turns = turn_count
  if turns % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
    
  end
  
  
  def turn
    
    puts "Please choose a number 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
  
    if valid_move?(index)
      player_sym = current_player
      move(index, player_sym)
      display_board
     else
       turn
     end
  end 
  
  def won?
     WIN_COMBINATIONS.each {|winning|
    index_0 = winning[0]
    index_1 = winning[1]
    index_2 = winning[2]

    pos1 = @board[index_0]
    pos2 = @board[index_1]
    pos3 = @board[index_2]

    if pos1 == "X" && pos2 == "X" && pos3 == "X"
      
      return winning 
      
    elsif pos1 == "O" && pos2 == "O" && pos3 == "O"
      
      return winning
      
    end
  }
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
  
  binding.pry
  
  def play
    
    while over? == false
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
    
  end
  
  
end 