require './main.rb'

B = 'blue'
R = 'red'

class Connect4Board < Board 
    attr_accessor :board_config
    def initialize
        @board_config = Array.new(6) {Array.new(7, 0)}
        
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
        @board_config[row].count(R) == 4 or  @board_config[row].count(B) == 4
    end
    
    def check_vertical?(column)
        @board_config.transpose[column].count(R) == 4 or @board_config.transpose[column].count(B) == 4
    end

    def check_diagonal?(col)
        
        for i in 0...6
            c1.push(@board_config[i][i])
            
        end
        for i in 0...7
            c2.push(@board_config[@dim-i-1][i])
        end
        if c1.count(R) == 4 || c2.count(R) == 4 || c1.count(B) ==4 || c2.count(B) ==4
            return true
        end
        false
    end

    

    
end