=begin

this is a simplified graph traversal set up
The corrdinate itself is a graph, and by default, 
every coordinate has an edge that goes to its neighbours

=end

class Graph 
  attr_accessor: @board, @knight

  def initialize()
    # nils
    @board = Array.new(8){Array.new(8, false)}
    # default position
    @knight = [3, 3]
  end

  def find_neighbours(coord)
    
    return [[coord[0] + 1, coord[1]], [coord[0], coord[1]+1]
            [coord[0] - 1, coord[1]], [coord[0], coord[1] -1]]

  end

  def dfs(destination)
    queue = [[3, 2]]
    @board[3][2] = true
    # initialize 
    while !queue.is_empty?
      next_stop = queue.shift
      queue.unshift(find_neighbours(next_stop)).flatten
      @board[next_stop[0]][next_stop[1]] = true

    end

  end
end

