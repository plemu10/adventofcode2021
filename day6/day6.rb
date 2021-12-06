input = File.readlines("input.txt").each {|line| line.strip!}		#read the file in and strip out the new line characters

#Part 1
count = 0                                   #variable to count the fish
fish = input[0].split(',')                  #create a list of fish using the comma as the delineator
fish = fish.map(&:to_i)                     #convert all those strings to integers to be the fish age

80.times do |day|                           #repeat 80 times
    fish.each_with_index do |x, index|      #go through the list of fish
        if x > 0                            #if the fish age is more than 0 days
            fish[index] -= 1                #decrease the age of the fish
        else                                #otherwise
            count += 1                      #increase the counter because the fish spawned a new fish
            fish[index] = 6                 #reset the current fishes age to 6
        end
    end
end

puts "Part 1 solution is #{count}"          #Output the solution

#Part 2
fish = input[0].split(',')                  #Reset the array of fish like we did before
fish = fish.map(&:to_i)                     #convert them to numbers like we did before
count = fish.length                         #Initialize the counter to be however many fish we are starting with

age0 = fish.count(0)                        #Initiatilize the arrays of the ages by finding the number of fish with that age in the list already
age1 = fish.count(1)
age2 = fish.count(2)
age3 = fish.count(3)
age4 = fish.count(4)
age5 = fish.count(5)
age6 = fish.count(6)
age7 = fish.count(7)
age8 = fish.count(8)

256.times do |day|                          #Repeat 256 times, yikes
    puts "Day #{day} has #{count} fish"     #Tracking the day we are procesing for ease
    count += age0                           #Increase the counter by the number of fish at 0 zero because they are spawning
    next_age8 = age0                        #Set the next age counter equal to the previous age counter
    next_age7 = age8
    next_age6 = age7 + age0                 #The number of age fish needs to include both the new fish just getting to 6, and fish that were at 0 and reset
    next_age5 = age6
    next_age4 = age5
    next_age3 = age4
    next_age2 = age3
    next_age1 = age2
    next_age0 = age1

    age0 = next_age0                        #Now that we have captured all the next ages, we can update the current age to that
    age1 = next_age1
    age2 = next_age2
    age3 = next_age3
    age4 = next_age4
    age5 = next_age5
    age6 = next_age6
    age7 = next_age7
    age8 = next_age8
end

puts "Part 2 solution is #{count}"          #Put out the answer