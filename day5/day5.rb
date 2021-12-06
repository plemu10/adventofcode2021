input = File.readlines("input.txt").each {|line| line.strip!}		#read the file in and strip out the new line characters
coords = []                                                         #new array to contain the input as coordinate pairs
input.each {|line| coords << line.split(' -> ') }                   #split each line of input into the coordinate pairs, and add to coords array
x_max = 1               #will store the biggest x value for generating the grid
y_max = 1               #will store the biggest y value for generating the grid
verticals = []          #will be all the vertical line coordinates
horizontals = []        #will be all the horizontal line coordinates
diagonals = []          #will be all the diagonal line coordinates

coords.each_with_index do |line, index|               #for each pair of coordinates in the list of coords
    start = line[0].split(',')           #start is an array of the first coordinate pair
    finish = line[1].split(',')          #finish is an array of the second coordinate pair
    start = start.map(&:to_i)                   #this converts the start coordinates to integer
    finish = finish.map(&:to_i)                  #this converts the finish coordinates to integer
    y_max = start[1] + 1 if start[1] >= y_max      #set ymax equal to the start y pos if its bigger
    y_max = finish[1] + 1 if finish[1] >= y_max    #set ymax equal to the finish y pos if its bigger
    x_max = start[0] + 1 if start[0] >= x_max      #set xmax equal to the start x pos if its bigger
    x_max = finish[0] + 1 if finish[0] >= x_max    #set xmax equal to the finish x pos if its bigger
    if (start[0] - finish[0]).abs == (start[1] - finish[1]).abs   #if the x position of start and finish and the y position of start and finish arent equal to each other
        #puts "Diagonal found #{line}"
        diagonals << line
    elsif start[0] == finish[0]         #if the x coordinates are the same, figure out y
        verticals << line
    elsif start[1] == finish[1]         #if the y coordinate are the same, figure out x
        horizontals << line
    end
    #puts "x_max is now #{x_max} and y_max is now #{y_max}"
end

grid = Array.new(x_max){Array.new(y_max, 0)}
#puts "Grid of size #{x_max} and #{y_max}"
verticals.each do |line|
    start = line[0].split(',')          #start is an array of the first coordinate pair
    finish = line[1].split(',')         #finish is an array of the second coordinate pair
    start = start.map(&:to_i)           #this converts the start coordinates to integer
    finish = finish.map(&:to_i)         #this converts the finish coordinates to integer
    temp = []                           #empty array to hold the start and finish values
    temp << start[1]                    #add the start y pos to the array
    temp << finish[1]                   #add the finish y pos to the array
    length = temp.max - temp.min + 1    #calculate the length of the line
    #puts "Vertical line #{line} of length #{length}"
    index = temp.min                    #set the index equal to the smaller line position
    length.times do |x|                 #do however many times length is
        grid[start[0]][index] += 1      #go to the x position in the grid, and add 1 to the y position of index
        index += 1                      #increment index
    end
end

horizontals.each do |line|
    start = line[0].split(',')          #start is an array of the first coordinate pair
    finish = line[1].split(',')         #finish is an array of the second coordinate pair
    start = start.map(&:to_i)           #this converts the start coordinates to integer
    finish = finish.map(&:to_i)         #this converts the finish coordinates to integer
    temp = []                           #empty array to hold the start and finish values
    temp << start[0]                    #add the start x pos to the array
    temp << finish[0]                   #add the finish x pos to the array
    length = temp.max - temp.min + 1    #calculate the length of the line
    #puts "Horizontal lines #{line} of length #{length}"
    index = temp.min                    #set the index equal to the smaller line position
    length.times do |x|                 #do however many times length is
        grid[index][start[1]] += 1      #go to the x position in the grid, and add 1 to the y position of index
        index += 1                      #increment index
    end
end

count = 0                   #count the number of positions with more than 1 line crossing

grid.each_with_index do |x|
    x.each do |y|
        count += 1 if y > 1
    end
end

puts "Part one is #{count}"

diagonals.each do |line|
    start = line[0].split(',')          #start is an array of the first coordinate pair
    finish = line[1].split(',')         #finish is an array of the second coordinate pair
    start = start.map(&:to_i)           #this converts the start coordinates to integer
    finish = finish.map(&:to_i)         #this converts the finish coordinates to integer
    length = (start[0] - finish[0]).abs + 1
    index = start[0]
    indey = start[1]
    length.times do |x|
        grid[index][indey] += 1      #go to the x position in the grid, and add 1 to the y position of index
        #puts "Mark up #{index} and #{indey}"
        #puts "Compare #{start[0]},#{finish[0]} and #{start[1]},#{finish[1]}"
        start[0] > finish[0] ? index -= 1 : index += 1 #increment index if the end value is higher, otherwise decrement
        start[1] > finish[1] ? indey -= 1 : indey += 1 #increment indey if the end value is higher, otherwise decrement
        #puts "#{index} and #{indey}"
    end
end

count = 0                   #count the number of positions with more than 1 line crossing

grid.each_with_index do |x|
    x.each do |y|
        count += 1 if y > 1
    end
end

puts "Part two is #{count}"