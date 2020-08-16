class Game
    attr_accessor :board, :player_1, :player_2, :timer,:input
      
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

        def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new, wargame = false)
            @player_1 = player_1
            @player_2 = player_2 
            @board = board
        end

        def current_player
            board.turn_count.even? ? player_1 : player_2 
        end

        def won?
            WIN_COMBINATIONS.any? do |combo| #check if postion 1 is equal to 2 and 2 to 3
                if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.taken?(combo[0]+1)
                   return combo
                end
            end
            false
        end

        def draw?
            @board.full? && !won?
        end

        def over?
            draw? || won? 
        end

        def winner
            if won?
                combo = won?
                @board.cells[combo[0]]
            end
        end

        def turn
            puts "Please enter a number 1-9:"
            @input = current_player.move(@board)
            if @board.valid_move?(@input)
                @board.update(input, current_player)
            else puts "Please enter a number 1-9:"
                @board.display
                turn
            end
            @board.display
        end

        def play
            turn until over?
            if won? 
                puts "Congratulations #{winner}!"
            elsif draw?
                puts "Cat's Game!"
            end
        end
end
