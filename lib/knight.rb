# require 'thread'
require 'set'


class Knight
    attr_accessor :position, :edge_list, :adjancency_matrix
    def initialize(position, board)
        @position = position
        @adjancency_matrix = Array.new(8){Array.new(8){0}}
        @edge_list = compute_moves
    end

    def distance(new_position)
        x_distance = (@position[0] - new_position[0]).abs
        y_distance = (@position[1] - new_position[1]).abs
      
        euclidean_distance = Math.sqrt(x_distance**2 + y_distance**2).round(2)
    end

    def compute_moves(position = @position)
        list = []
        current_x, current_y = position

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
    
    def reconstruct_path(parent, start, target)
        path = [target]
        current_node = target

        while current_node != start
        parent_node = parent[current_node]
        path.unshift(parent_node)
        current_node = parent_node
        end

        path
    end

    def shortest_path(start, target)
        queue = Queue.new
        visited = Set.new
        parent = {}
        queue.enq(start)
        visited.add(start)

        until queue.empty?
            #Add coordinate to the queue and compute it's moves
            current_node = queue.deq

            if current_node == target
                path = reconstruct_path(parent, start, target)
                return path
            end

            moves = compute_moves(current_node)
            
            moves.each do |move|
                unless visited.include?(move)
                    queue.enq(move)
                    visited.add(move)
                    parent[move] = current_node
                end
            end
            
        end

        return nil
    end

end

class Graph
    def initialize(moves, currnt_pos)
        
    end
end

class Node
    def initialize(value)
        @value = value
    end

end


class GameBoard
    attr_accessor :matrix
    def initialize(rows, columns)
        @matrix = Array.new(rows){ Array.new(columns){0} }
    end
end

translator = {}
64.times do |time|

end