class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2], #top horizontal row
    [3, 4, 5], #middle horizontal row
    [6, 7, 8], #bottom horizontal row
    [0, 3, 6], #left vertical column
    [1, 4, 7], #middle vertical column
    [2, 5, 8], #right vertical column
    [0, 4, 8], #diagonal top-left to bottom-right
    [2, 4, 6]  #diagonal top-right to bottom-left
  ]
  
  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end
  
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

  def move(position, character = 'X')
    @board[position] = character
  end

  def position_taken?(index)
    if(@board[index] == " " || @board[index] == nil || @board[index] == "")
        false
    else
        true
    end
  end

  def valid_move?(index)
    if(!position_taken?(index) && index.between?(0, 8))
        true
    else
        false
    end
  end

  def turn_count
    number_of_turns = 0
    @board.each do |board| 
        if board != " "
            number_of_turns += 1
        end
    end
    number_of_turns
  end

  def current_player
    if turn_count % 2 == 0
        "X"
    else 
        "O"
    end
  end

  def turn
    counter = 0

    until counter == 1
    
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        if valid_move?(index)
            move(index, current_player)
            counter += 1
        else    
        end
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.find do |wincombo|
        position_taken?(wincombo[0]) &&
        @board[wincombo[0]] == @board[wincombo[1]] &&
        @board[wincombo[1]] == @board[wincombo[2]] 
    end
  end

  def full?
    @board.none?{|board| board == " "}
  end

  def draw?
    full? && !won?    
  end

def over?
    full? || won? || draw?
end

  def winner 
    wincombo = won?
    if(wincombo == nil)
        return nil
    elsif(@board[wincombo[0]] == "X")
        return "X"
    else
        return "O"
    end
  end

  def play 
    until over?
        turn
    end

    if won?
        if(winner == "X")
            puts "Congratulations X!"
        else
            puts "Congratulations O!"
        end
    else
        puts "Cat's Game!"
    end
  end
end
