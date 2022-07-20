require 'pry'

class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [ 
        [0,1,2], # top_row 
        [3,4,5], # middle_row 
        [6,7,8], # bottom_row 
        [0,3,6], # left_column 
        [1,4,7], # center_column 
        [2,5,8], # right_column 
        [0,4,8], # left_diagonal 
        [6,4,2] # right_diagonal 
        ]
    
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "----------------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "----------------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token="X")
        @board[index] = token
    end

    def position_taken?(index)
        if @board[index] != " "
            true
        else 
            false
        end
    end

    def valid_move?(index)
        position_taken?(index) ? false : true && index.between?(0, 8)
    end

    def turn_count
        @board.count{ |space| space != " "}
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        user_input = gets.strip
        index = input_to_index(user_input)
        valid_move?(index)
        current_player(turn_count)
    end

end