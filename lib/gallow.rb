def gallow
    if @mistakes <= 5 then head = "O" end
    if @mistakes <= 4 then left_arm = "/" end
    if @mistakes <= 3 then body = "|" end
    if @mistakes <= 2 then right_arm = "\\" end
    if @mistakes <= 1 then left_leg = "/" end
    if @mistakes == 0 
        right_leg = "\\" 
        puts "You are dead! Game Over!"
        end_game
        exit
    end

    gallow = "
        — — — — — -                                     Letters guessed: #{@letters_guessed}
        |           #{head}
        |          #{left_arm}#{body}#{right_arm}
        |          #{left_leg} #{right_leg}
        |
        |
        |               #{@word}
    - - - - -  
    "
    puts gallow
end
