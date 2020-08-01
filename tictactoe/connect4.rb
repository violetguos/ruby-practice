require './main.rb'

B = 'B'
R = 'R'

class Connect4Board < Board 
    attr_accessor :board_config, :win_player
    def initialize
        @x_dim = 7
        @y_dim = 6
        @board_config = Array.new(@x_dim) {Array.new(@y_dim, 0)}
        
        @win_player = nil
    end 
    def set(col, move)
        # sink to the bottom
        row_idx = 0
        @board_config.transpose[col].each_with_index do |elem, i|
            if elem == 0
                row_idx = i
                break
            end
        end 
        
        @board_config[row_idx][col] = move
    end

    def check_horizontal?(row)
        @win_player = R if count_consecutive(@board_config[row])[R] == 4 
        @win_player = B if count_consecutive(@board_config[row])[B] == 4
        count_consecutive(@board_config[row])[R] == 4 or count_consecutive(@board_config[row])[B] == 4
    end
    
    def check_vertical?(column)
        @win_player = R if count_consecutive(@board_config.transpose[column])[R] == 4 
        @win_player = B if count_consecutive(@board_config.transpose[column])[B] == 4 
        count_consecutive(@board_config.transpose[column])[R] == 4 or count_consecutive(@board_config.transpose[column])[B] == 4
    end

    def count_consecutive(arr)
        arr.chunk{|y| y}.map{|y, ys| [y, ys.length]}.to_h
    end

    def check_diagonal?
        # it's not the best algo
        # we essentially sweep the board in 4 diagonals

        for i in 0...@x_dim
            for j in 0...@y_dim
            c1 = []
            x = i
            y = j
            
            while x < @x_dim && y < @y_dim
                c1.push(@board_config[x][y])
                x +=1
                y +=1

            end
            
            if count_consecutive(c1)[R] == 4 
                @win_player = R
                return true

            elsif count_consecutive(c1)[B] == 4 
                @win_player = B
                return true
            end

            c1 = []
            x = @x_dim - i - 1
            y = @y_dim - j - 1
            while x >0 && y > 0
                c1.push(@board_config[x][y])
                x -=1
                y -=1
            end

            if count_consecutive(c1)[R] == 4 
                @win_player = R
                return true

            elsif count_consecutive(c1)[B] == 4 
                @win_player = B
                return true
            end

            c1 = []
            x = i
            y = @y_dim - j - 1

            while x < @x_dim && y > 0
                c1.push(@board_config[x][y])
                x +=1
                y -=1
            end
            if count_consecutive(c1)[R] == 4 
                @win_player = R
                return true

            elsif count_consecutive(c1)[B] == 4 
                @win_player = B
                return true
            end

            c1 = []
            x = @x_dim - i - 1
            y = 0

            while x >0 && y < @y_dim
                c1.push(@board_config[x][y])
                x -=1
                y +=1
            end

            if count_consecutive(c1)[R] == 4 
                @win_player = R
                return true

            elsif count_consecutive(c1)[B] == 4 
                @win_player = B
                return true
            end

        end # for j
        end # for i
        false
    end

    def check_winner?
        winner = false
        i = 0

        while !winner && i < @y_dim do
            winner = check_vertical?(i)
            i+=1
        end

        return winner if winner
        

        winner = false

        i = 0
        while !winner && i < @x_dim do
            winner = check_horizontal?(i)
            i+=1
        end
            
        return winner if winner

        winner = check_diagonal?

        return winner
        
    end

    def print_b
      @board_config.reverse.each_with_index do |row, idx|
        row.each_with_index do |elem, elem_idx|
          if elem != 0
            print elem
          else
            print " "
          end
          
          print '|'
          
        end
        print "\n"
      end
    end
    
end

class Player
  
    @@board = Connect4Board.new
    def get_board
        puts "New Turn \n"
        @@board.print_b
    end
    def initialize
        
        @scoreR = 0
        @scoreB = 0
    
    end


    def game
      while !@@board.check_winner?
        puts "Player R enter column: "
        move_a = gets.chomp
        @@board.set(move_a.to_i, R)

        puts "Player B enter column: "
        move_a = gets.chomp
        @@board.set(move_a.to_i, B)
        @@board.print_b
      end
      
      puts "#{@@board.win_player} won!!"

    end



  end
  

game = Player.new
game.game