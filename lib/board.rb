class Board
    attr_accessor :cells

    def initialize
        reset!
    end

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input) #input equal "1" for top left. Adjust for array with -1
        cells[input.to_i - 1]
    end

    def full?
        cells.all?{|space| space != " "}
    end

    def turn_count
        cells.count{|space| space == "X" || space == "O"}
    end

    def taken?(move)
        position(move) == "X" || position(move) == "O" 
    end

    def valid_move?(move)
        !(taken?(move.to_i)) && move.to_i.between?(1, 9)
    end

    def update(move, player)
        cells[move.to_i - 1] = player.token
    end
    
end