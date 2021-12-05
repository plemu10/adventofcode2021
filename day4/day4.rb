#Part 1 
require_relative 'win_calc'
input = File.readlines("input.txt").each {|line| line.strip!}		#read the file in and strip out the new line characters
draw = File.readlines("input2.txt").each {|line| line.split(',')}   #read in the second file and split on the comma
draw = draw[0].split(',')                                           #theres only one line, split it and overwrite

cards = []                        #empty array to store the cards
card_rows = []                     #empty array to build cards into

input.each do |line|              #gotta build some cards, so iterate through the input
    if line == ""
        temp = card_rows.dup        #duplicate the current card rows to a temp array because card rows must be cleared
        cards << temp               #add the temp array to cards
        card_rows.clear             #clear the card rows
    else
        card_rows << line.split     #add the line split on whitespace to the list of card rows
    end
end

draw.each do |num|                  #iterate for all of the drawn numbers
    cards.each do |card|            #check every card
        card.each do |row|                      #check each row within each card
            row.each_with_index do |ele, index| #check each element within each row
                if ele == num                   #see if it matches the current drawn number
                    row[index] = "HIT"          #if it does, replace number with HIT
                end
            end
        end
    end
    cards.each_with_index do |card, place|            #Once all the cards have been processed, need to check for win condition
        card.each do |row|
            if row[0] == "HIT" && row[1] == "HIT" && row[2] == "HIT" && row[3] == "HIT" && row[4] == "HIT"
                win_calc(card, num)
                cards.delete_at(place)
            end
        end
        card[0].each_with_index do |ele, index|
            if ele == "HIT"
                if card[1][index] == "HIT" && card[2][index] == "HIT" && card[3][index] == "HIT" && card[4][index] == "HIT"
                    win_calc(card, num)
                    cards.delete_at(place)
                end
            end
        end
    end
end
#ards.each {|card| puts "This is a card #{card}"}   #this is useful for visualizing the output easily
