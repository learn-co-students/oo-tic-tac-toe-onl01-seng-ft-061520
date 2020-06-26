require 'pry'

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
        [2,4,6]
    ]
    
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        user_input = user_input.to_i
        user_input -1
    end
    
    def move (index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
       if  @board[index] ==  " "
        false
       else
        true
       end
        
    end

    def valid_move?(position)
        if position.between?(0, 8) && self.position_taken?(position) == false
            true
        else
            false
        end
        
    end

    def turn_count
        @board.count {|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Enter a number between 1 and 9"
        input = gets.strip
        index = input_to_index(input)
        player = current_player
         if valid_move?(index)
            move(index, player)
            display_board
         else
            puts "invalid"
            turn
         end
    end
    
    def won?
        WIN_COMBINATIONS.detect do |win|
            if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
                win
            elsif @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
                win
            else
                false
            end
        end
    end

    def full? 
        @board.all?{|a| a != " "}
    end

    def draw?
      !(won?) && (full?)   
    end

    def over?
        (won?) || (draw?)
    end

    def winner 
        if (won?)
            "#{@board[won?[0]]}"
        end
    end

    def play 

        while !(over?) do
            turn
        end
        if (won?)
            puts "Congratulations #{winner}!"
        elsif (draw?)
            puts "Cat's Game!"
        end
    end
end


