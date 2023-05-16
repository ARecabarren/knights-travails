class Knight
    attr_accessor :position, :edge_list
    def initialize(position)
        @position = position
        @edge_list = compute_moves
    end

    def compute_moves
        list = []
        current_x, current_y = @position

        possible_moves = [
            [-2, -1], [-2, 1],
            [2, -1], [2, 1],
            [-1, -2], [1, -2],
            [-1, 2], [1, 2]
        ]
        
        possible_moves.each do |move|
            xstep, ystep = move
            new_x = current_x + xstep
            new_y = current_y + ystep

            if new_x.between?(0, 7) && new_y.between?(0, 7)
                list << [new_x, new_y]
            end
        end

        list
    end

end

class GameBoard
    attr_accessor :board
    def initialize(rows, columns)
        @board = Array.new(rows){ Array.new(columns){0} }
    end
end