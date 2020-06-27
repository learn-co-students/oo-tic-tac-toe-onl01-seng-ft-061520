require 'pry'

class TicTacToe
  
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
  
  def initialize
    @board = board || Array.new(9," ")
  end
  
  def board
    @board
  end
  
  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(space, token)
    @board[space] = token
  end
  
  def position_taken?(index)
    board[index] == "X" || board[index] == "O"
  end
  
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      true
    else 
      false
    end 
  end
  
  def turn
    input = gets
    user_input = input_to_index(input)
    player = current_player
    if valid_move?(user_input)
      move(user_input, player)
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
    WIN_COMBINATIONS.detect do |win_combo|
    i_0 = win_combo[0]
    i_1 = win_combo[1]
    i_2 = win_combo[2]

    position_1 = @board[i_0]
    position_2 = @board[i_1]
    position_3 = @board[i_2]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
        false
    end
  end

  
  def full?
    @board.all?{|taken| taken != " "}
  end
  
  def draw?
    !won? && full?
  end
  
  
  def over?
    if won? || full? || draw?
      true
    else
      false
    end
  end 
  
  def winner
    WIN_COMBINATIONS.detect do |win_combo|
    i_0 = win_combo[0]
    i_1 = win_combo[1]
    i_2 = win_combo[2]

    position_1 = @board[i_0]
    position_2 = @board[i_1]
    position_3 = @board[i_2]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return "X"
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return "O"
      end
        false
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