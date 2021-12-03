#Part 1 
input = File.readlines("input.txt").each {|line| line.strip!}		#read the file in and strip out the new line characters
gamma = ""                                                          #declare empty counters and variables
epsilon = ""
index = 0
zero = 0
one = 0

while index < 12                                 #the numbers in the list are 12 characters long, so only do it 12 times
    input.each do |line|                         #for each line in input
        case line[index].to_i                    #test the character at the index position, converted to integer
        when 1
            one += 1                             #increment one
        when 0
            zero += 1                            #increment zero
        end
    end

    if zero > one                                #if the zero value is most numerous
        gamma += "0"                             #add a 0 to gamma
        epsilon += "1"                           #add a 1 to epsilon
    else
        gamma += "1"                             #add a 1 to gamma otherwise
        epsilon += "0"                           #add a 0 to epsilon otherwise
    end
    zero = 0                                     #reset counters to 0
    one = 0
    index += 1                                   #increment index
end

puts gamma.to_i(2) * epsilon.to_i(2)             #to_i(base) interprets the string as a number of the specified base
                                                 #this ultimately converts it to decimal notation as an integer
#Part 2

o2 = input.dup                                   #creates a duplicate of the input array, must use .dup or the arrays are LINKED and not COPIED
co2 = input.dup
zero = 0                                         #reset counters
one = 0
index = 0

while o2.length > 1                              #do until there is only 1 element left in the o2 array
    o2.each do |line|                            #interate through each line of o2
        case line[index].to_i                    #test the character at the index position
        when 1
            one += 1
        when 0
            zero += 1
        end
    end
    if zero > one                                #compare the zero and one counters
        o2.delete_if { |x| x[index] == "1" }     #deletes elements from the array if they match a condition, in this the condition is if the index element is 1
    elsif one > zero
        o2.delete_if { |x| x[index] == "0" }     #deletes every line where the index element is 0
    elsif one == zero
        o2.delete_if { |x| x[index] == "0" }    #if its a tie, delete the 0's and keep the 1's
    end
    index += 1                                  #increment index
    one = 0                                     #reset counters for the next pass
    zero = 0        
end

zero = 0                                        #reset al lthe counters again for the co2 list
one = 0
index = 0

while co2.length > 1                            #do until there is only 1 element left in the co2 array
    co2.each do |line|                          #iterate through each line of co2
        case line[index].to_i                   #test the character in the index position
        when 1
            one += 1
        when 0
            zero += 1
        end
    end
    if zero < one
        co2.delete_if { |x| x[index] == "1" }  #delete elements from the array if the index position is a 1
    elsif one < zero
        co2.delete_if { |x| x[index] == "0" }  #delete elements from the array if the index position is a 0
    elsif one == zero
        co2.delete_if { |x| x[index] == "1" } #if there is a tie, keep the 0's
    end
    index += 1                                  #increment index
    one = 0                                     #reset counters
    zero = 0                    
end

puts o2[0].to_i(2) * co2[0].to_i(2)             #display the output of the product of the only elements, converted to decimal, in o2 and co2

