class TicTacToe
  def initialize(board = nil)
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
    def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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
    
    def input_to_index(str)
      str.to_i - 1
    end
    
    def move(player_move, player_token = "X")
      @board[player_move] = player_token
    end
    
    def position_taken?(position)
      @board[position] != " "
    end
    
    def valid_move?(index)
       !position_taken?(index) && index.between?(0,8)
    end
    
    def turn
      puts "choose a number from 1 to 9"
      input = gets
      indexed_input = input_to_index(input)
      if valid_move?(indexed_input)
        player_token = current_player
        move(indexed_input, player_token)
      else
        turn
     end
      display_board
    end
    
      def turn_count
        counter = 0
        @board.each do
          |index| if index != " "
          counter += 1
          end
        end
        counter
      end
      
      def current_player
        if turn_count.even?
          "X"
        else
          "O"
        end
      end
      
      def won?
      a = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    }
      b = WIN_COMBINATIONS.find{
      |combo|
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    }
      return a || b
      end
      
      def full?
        @board.all?{|i| i != " "}
    end
    
    def draw?
      true if full? && !won?
    end
    
    def over?
      won? || draw?  
    end 
    
    def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    end
  end
  
  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end

game = TicTacToe.new