#Part 1 
input = File.readlines("input.txt").each {|line| line.strip!}		#read the file in and strip out the new line characters
x = 0                             #variable for horizontal position
y = 0                             #variable for depth

input.each do |line|             #loop through each line of input                              
    temp = line.split            #split the line on the whitespace
    case temp[0]                 #test for multiple cases on what the word could be
    when "forward"               #when its forward
        x += temp[1].to_i        #add the second element of the line converted to integer to the horizontal position
    when "up"                    #when its up
        y -= temp[1].to_i        #subtract the second element converted to integer from depth
    when "down"                  #when its down
        y += temp[1].to_i        #add the second element converted to integer to depth
    end
end

puts x * y                      #output the product of x and y

#Part 2
x = 0                           #reset horizontal position to zero
y = 0                           #reset depth to zero
a = 0                           #create and set aim to zero

input.each do |line|            #loop through each line of input
    temp = line.split           #split on the whitespace
    case temp[0]
    when "up"
        a -= temp[1].to_i       #when up, subtract the number from aim
    when "down"
        a += temp[1].to_i       #when down, add the number to aim
    when "forward"
        x += temp[1].to_i       #when forward, add the number to horizontal position
        y += temp[1].to_i * a   #also add the product of the number and aim to depth
    end
end

puts x * y                      #output the product of x and y