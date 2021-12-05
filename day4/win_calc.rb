def win_calc(card, num)
    win_val = 0
    card.each { |row| row.each {|x| win_val += x.to_i} }
    puts win_val * num.to_i
    #exit
end