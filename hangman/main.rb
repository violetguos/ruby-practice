def pick_random_line
    chosen_line = nil
    while chosen_line == nil or chosen_line.length < 5 or chosen_line.length>10
        File.foreach("5desk.txt").each_with_index do |line, number|
        chosen_line = line if rand < 1.0/(number+1)
        end
    end
    
    return chosen_line.gsub!(/[^A-Za-z]/, '')
end

