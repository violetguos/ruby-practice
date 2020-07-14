def pick_random_line
    chosen_line = nil
    while chosen_line == nil or chosen_line.length < 5 or chosen_line.length>10
        File.foreach("5desk.txt").each_with_index do |line, number|
        chosen_line = line if rand < 1.0/(number+1)
        end
    end
    
    return chosen_line.gsub!(/[^A-Za-z]/, '')
end

class Game
    attr_accessor :guess_word_config
    def initialize
        @correct_word = pick_random_line
        @guess_word_config = Array.new(@correct_word.length, "_")
        @incorrect_letters = []
    end

    def display(guess)
        # display the correct answers and "_"
        @correct_word.split("").each_with_index do |c, idx|
            if c == guess
                @guess_word_config[idx] = guess
            end
        end
        p @guess_word_config
    end

    def input_validation
        guess = nil
        while guess == nil
            puts "Enter your answer: "
            guess = gets.chomp
            if guess =~ /[A-Za-z]/
                guess.downcase!
                return guess
            end
        end
    end

    def step
        guess = input_validation
        if @correct_word.include?(guess)
            display(guess)
        else
            if !@incorrect_letters.include?(guess)
                @incorrect_letters.push(guess) 
            end   
            p @guess_word_config
            puts "Incorrect letters: #{@incorrect_letters}"
        end
    end

    def check_answer?
        @correct_word == @guess_word_config.join("")? true: false
    end

    def rounds
        cnt = 0
        save_game = false
        while cnt < @correct_word.length && !save_game
            step
            cnt +=1
            save_game = self.save
        end
        p "Game over, answer was #{@correct_word}"
    end

    def save
        puts "Would you like to save game? [y/n]"
        ans = gets.chomp
        if ans.downcase == "y"
            File.open('game', 'w+') do |f|  
                f.write(Marshal.dump(self))
            end  
        
        return true 
        end
    end

    def self.load
        Marshal.load(File.binread("game"))
    end
      
      

end

puts "Would you like to resume game? [y/n]"
ans = gets.chomp

if ans.downcase == "y"
    game = Game.load
else
    game = Game.new
end
game.rounds
