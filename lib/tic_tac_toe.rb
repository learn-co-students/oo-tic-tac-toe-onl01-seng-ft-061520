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
    input = gets.strip
    index = input_to_index(input)    
    if valid_move?(index) 
       move(index, current_player) 
       display_board
    else
      turn
    end 
  end


  def won?

    WIN_COMBINATIONS.each do |winner|
    index_0 = winner[0]
    index_1 = winner[1]
    index_2 = winner[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return winner
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return winner
      end
    end
  return false 
end 
 

  def full?
    !@board.any?{|win| win == " "}

  end

  def draw?
    !won? && full?
  end


  def over?
    won? || draw?
    end 
  
  def winner
      
      WIN_COMBINATIONS.each do |winner|
    index_0 = winner[0]
    index_1 = winner[1]
    index_2 = winner[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
      end
    end
    return nil 
  end 

  def play 
    until over? 
    turn
    end
    puts "Congratulations #{winner}!"
    if draw?
    puts "Cat's Game!"
    end
  end 


  def draw?
    !won? && full?
  end


  def over?
    won? || draw?
    end 
  
  def winner
      
      WIN_COMBINATIONS.each do |winner|
    index_0 = winner[0]
    index_1 = winner[1]
    index_2 = winner[2]

    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
      end
    end
    return nil 
  end 

  def play 
    until over? 
    turn
    end
    if winner
    puts "Congratulations #{winner}!"
    elsif draw?
    puts "Cat's Game!"
      end 
    end 
  end 