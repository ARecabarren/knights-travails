require_relative('./lib/knight')

board = GameBoard.new(8,8)

dark_knight = Knight.new([3,3], board)
p dark_knight.edge_list 
puts ' 0--1--2--3--4--5--6--7'
dark_knight.adjancency_matrix.each do |line|
    p line
end