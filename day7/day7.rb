input = File.readlines("input.txt").each {|line| line.strip!}		#read the file in and strip out the new line characters

positions = input[0].split(',')     #create a list of positions by splitting the line on the comma
positions = positions.map(&:to_i)   #convert the array to integers

#part 1

test_pos = (1..positions.length).to_a       #create an array of test_positions that is all possible averages in positions
fuel = 9999999999                           #set fuel arbitrarily high for the first comparison
test_fuel = 0                               #set test_fuel to zero to be the counter

test_pos.each do |x|                        #for every test position
    positions.each do |y|                   #for every position
        test_fuel += (y - x).abs            #increment test_fuel by the absolute distance between the position and the potential average
    end
    fuel = test_fuel if test_fuel < fuel    #see if the test fuel counter is lower than the current fuel counter
    test_fuel = 0                           #reset test_fuel to zero
end

puts fuel                                   #output the answer

#part 2

test_pos = (1..positions.length).to_a       #create an array of test_positions that is all possible averages in positions
fuel = 9999999999                           #set fuel arbitrarily high for comparison
test_fuel = 0                               #set the test_fuel counter to zero

test_pos.each do |x|                        #for each potential average to test
    positions.each do |y|                   #for each position
        distance = (y - x).abs              #calculate the absolute distance from position to potential average
        (1..distance).each do |z|           #for each increment of that distance
            test_fuel += z                  #add the current number, this effectively gives n = n + 1
        end    
    end
    fuel = test_fuel if test_fuel < fuel    #see if the test_fuel counter is lower than the current fuel counter
    test_fuel = 0                           #reset test_fuel for the next run
end

puts fuel                                   #output the answer