def start
    file = File.readlines('google-10000-english-no-swears.txt')

    words = []
    file.each do |word|
        word = word.gsub("\n","")
        if word.length >= 5 and word.length <=12
        words << word
        end
    end

    words.sample
end

def save_game
    save = {
        :hangman => @hangman, 
        :word => @word,
        :letters_guessed => @letters_guessed,
        :mistakes => @mistakes,
    }
    File.open("saved_game.yml", "w") {|file| file.write(save.to_yaml)}
    puts "Game Saved"
end

def end_game
    save = {
        :hangman =>"", 
        :word => "",
        :letters_guessed => "",
        :mistakes => "",
    }
    File.open("saved_game.yml", "w") {|file| file.write(save.to_yaml)}
end

def win
    if @word.delete(' ') == @hangman
        puts "Great job, you guessed the word!!"
        end_game
        exit
    end
end

def good_guess
    position = @hangman.split(//).each_index.select {|x| @hangman[x] === @letter_guess}
    @word = @word.split()
    position.each do |x|
        @word[x] = @letter_guess
    end
    @word.join(" ")
end

def upload_game?
    while answer = gets.chomp.downcase
        case 
        when answer == "y"
            file = YAML.load(File.read("saved_game.yml"))
            @hangman = file[:hangman]
            @word = file[:word]
            @letters_guessed = file[:letters_guessed]
            @mistakes = file[:mistakes]
            puts "Attemps left: #{mistakes}\n\n"
            puts gallow
            break
        when answer == "n"
            @letters_guessed = []
            @word =  " _ " * @hangman.length 
            break
        else 
        puts "Choose either Y or N\n\n"
        end
    end
end