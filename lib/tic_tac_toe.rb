class TicTacToe
  def initialize(board =  nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
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
  
  def move(index, character = "X")
    @board[index] = character
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == false
      return true
    else
      return nil
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, character = "#{current_player}")
      display_board
    else
      turn
    end
  end
  
  def turn_count
    number_of_turns = 0
    @board.each do |turns|
      if turns == "X" || turns == "O"
        number_of_turns += 1
      end
    end
    return number_of_turns
  end
  
  def current_player
    turn_count % 2 == 0 ?  "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      position_1 = @board[win_index_1] 
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
    
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    nil
  end
  
  def full?
    if @board.any?{|index| index==" " || index=="" || index==nil}
      false
    else
      true
    end
  end
  
  def draw?
    if full? && !won?
      true
    else
      false
    end
  end
  
  def over?
    if won? || full?
      true
    else
      false
    end
  end
  
  def winner
    if won?
      return @board[won?[0]]
    else
      nil
    end
  end
  
  def play
    until over?
      turn
      if won?
        puts "Congratulations #{winner}!"
        return
      elsif draw?
        puts "Cat's Game!"
        return
      end
    end
    if won?
      puts "Congratulations #{winner}!"
      return
    elsif draw?
      puts "Cat's Game!"
      return
    end
  end

end