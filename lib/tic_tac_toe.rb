class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(string_num)
    num = string_num.to_i
    num -= 1 
  end
  def move(index, token="X")
    @board[index] = token
  end
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end
  def valid_move?(index)
    index >= 0 && index <= 8 && position_taken?(index) == false
  end
  def turn
    puts "Please enter a number (1-9):"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end
  def turn_count
    @board.count{|i| i!=" "}
  end
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end
  def won?
    WIN_COMBINATIONS.any? do |array|
      if position_taken?(array[0]) && @board[array[0]] == @board[array[1]] && @board[array[1]] == @board[array[2]]
        return array
      end
    end
  end
  def full?
    @board.none?(" ")
  end
  def draw?
    full? == true && won? == false
  end
  def over?
    won? || draw?
  end
  def winner
    if array = won?
      @board[array[0]]
    end
  end
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