#Part 1 
input = File.readlines("input.txt").each {|line| line.strip!}		#read the file in and strip out the new line characters
count = 0                                                           #initiatlize a counter to keep track of increases

input.each_with_index do |row, index|                               #loop through all the input with index
    #puts "#{row.to_i} index #{index}"                              #debug to see if im getting the right output approximately
    if input[index].to_i > input[index - 1].to_i                    #compare the current line to the previous one and see if it's bigger
        #puts "#{input[index]} is greater than #{input[index - 1]}" #debug to see if its comparing right
        count = count + 1                                           #increment the counter
    end
end

puts count                                                          #part 1 answer

#Part 2

count = 0                                                           #zero out counter
window = []                                                         #create a new empty list to hold the summed values
input.each_with_index do |row, index|
    temp = input[index].to_i + input[index + 1].to_i + input[index + 2].to_i    #add the current and next two values
    #puts "Next window is #{temp}"                                  #debug to see if its adding right
    window << temp                                                  #add to the window array
end

window.each_with_index do |row, index|                              #loop through all the input with index
    #puts "#{row.to_i} index #{index}"                              #debug to see if im getting the right output approximately
    if window[index].to_i > window[index - 1].to_i                  #compare the current line to the previous one and see if it's bigger
        #puts "#{window[index]} is greater than #{window[index - 1]}" #debug to see if its comparing right
        count = count + 1                                           #increment the counter
    end
end

puts count