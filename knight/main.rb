=begin

this is a simplified graph traversal set up
The corrdinate itself is a graph, and by default, 
every coordinate has an edge that goes to its neighbours

=end

require 'set'
require "test/unit"


class Graph 

  def initialize()
    # nils
    @board = Array.new(8){Array.new(8, 1)}
    # default position
    @knight = [3, 3]
  end

  def find_neighbours(coord)
    valid_moves = [
                    [1, 2], [1, -2], [-1, 2], [-1, -2],
                    [2, 1], [2, -1], [-2, 1], [-2, -1]                                    
                  ]
    valid_neighbours = []
    valid_moves.each do |m| 
      x = m[0] + coord[0]
      y = m[1] + coord[1]
      if !(x < 0 or x > 7 or y < 0 or y > 7)
        valid_neighbours.push([x, y])
      end
    end
    return valid_neighbours
  end

  def bfs(start, destination)
    start_node = {"node"=>start, "cost"=>0, "path"=>[start]}
    queue = [start_node]
    visited = Set[]
    # initialize 
    while !queue.empty?
      state = queue.shift()
      stop = state["node"]
      cost = state["cost"] 
      path = state["path"]
      

      #puts path
      if stop == destination
        return path
      end 

      if !visited.include?(stop)
        visited.add?(stop) 
        #p "stop #{stop}"
        valid_neighbours = find_neighbours(stop)
        #p valid_neighbours
        valid_neighbours.each do |node|
          next_cost = cost + 1
          # ruby can't keep original `path` arr after #push
          # we create from scratch
          next_path = []
          path.each { |p| next_path.push(p)}
          next_path.push(node)
          queue.push({"node"=>node, "cost"=>next_cost, "path"=>next_path})
        end
      end
    end
    # no solution
    return []

  end
end

graph = Graph.new()
p graph.bfs([0,0],[3, 3])


class TestSimpleNumber < Test::Unit::TestCase
 
  def test_simple
    graph = Graph.new()
    assert_equal([[0,0],[1,2]], graph.bfs([0,0],[1,2]))
    assert_equal([[0,0],[1,2],[3,3]], graph.bfs([0,0],[3,3]))
    assert_equal([[3,3], [4,5],[6,4],[4,3]], graph.bfs([3,3],[4,3]))
    
  end   
end
