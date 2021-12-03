#Part 1 
input = File.readlines("input.txt").each {|line| line.strip!}		#read the file in and strip out the new line characters
gamma = ""
epsilon = ""
index = 0
zero = 0
one = 0

while index < 12
    input.each do |line|
        case line[index].to_i
        when 1
            one += 1
        when 0
            zero += 1
        end
    end

    if zero > one
        gamma += "0"
        epsilon += "1"
    else
        gamma += "1"
        epsilon += "0"
    end
    zero = 0
    one = 0
    index += 1
end

puts gamma.to_i(2) * epsilon.to_i(2)

