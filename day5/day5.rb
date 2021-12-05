input = File.readlines("input.txt").each {|line| line.strip!}		#read the file in and strip out the new line characters
coords = []                                                         #new array to contain the input as coordinate pairs
input.each {|line| coords << line.split(' -> ') }                   #split each line of input into the coordinate pairs, and add to coords array

coords.each_with_index do |line, index|               #for each pair of coordinates in the list of coords
    start = line[0].split(',')           #start is an array of the first coordinate pair
    finish = line[1].split(',')          #finish is an array of the second coordinate pair
    if start[0] != finish[0] && start[1] != finish[1]   #if the x position of start and finish and the y position of start and finish arent equal to each other
        coords.delete_at(index)         #delete the coordinate that we don't need, leaving a list of only relevant pairs
    end
end
