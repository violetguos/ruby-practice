class Board
    attr_accessor :board_config, :dim
  
    def initialize
      @board_config = [["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]] # 3 by 3
      @dim = 3
    end
  
    def lookup(coord)
      return @board_config[coord[0]][coord[1]]
    end
  
    def set(coord, move)
      @board_config[coord[0]][coord[1]] = move
    end
  
    def check_horizontal?(row)
      @board_config[row].uniq.size <= 1 
    end
  
    def check_vertical?(column)
      @board_config.transpose[column].uniq.size<=1
    end
  
    def check_diagonal?()
      c1 = Array.new
      c2 = Array.new
      for i in 0...@dim
        c1.push(@board_config[i][i])
        c2.push(@board_config[@dim-i-1][i])
      end
      if c1.uniq.size <= 1 or c2.uniq.size <=1
        return true
      end
    end
  
    def print_b
      @board_config.each_with_index do |row, idx|
        row.each_with_index do |elem, elem_idx|
          print elem
          if elem_idx == 2
            print "\n"
          else
            print '|'
          end
        end
      end
    end
  
  
    def check_winner(coord)
      if check_diagonal?() || check_horizontal?(coord[0]) || check_vertical?(coord[1])
        return true
      end
    end
  end
  
  class Player
  
    @@board = Board.new
    def get_board
      puts "New Turn \n"
      @@board.print_b
    end
    def initialize(name)
      @name = name
      @score = 0
    end
  
    def move(coord)
      @@board.set(coord, @name)
      if @@board.check_winner(coord)
        puts "#{@name} won!!"
      end
    end
  end
  


