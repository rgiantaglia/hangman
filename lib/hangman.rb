require 'YAML'

require_relative 'gallow'
require_relative 'game_settings'

class Game

    attr_accessor :i, :mistakes, :hangman, :letters_guessed, :letter_guess, :word

    def initialize
        @i = 1
        @mistakes = 6
        @hangman = start
        @letters_guessed
        @letter_guess
        @word = word
    end

    puts "Hangman Initialized!\n\n"
    puts "Are you returning from a previous game?"
    puts "If yes, enter Y, if not, then enter N\n\n"

    def play

        upload_game?

        while i <= 6 do

            puts "Continue playing game or save progress?"
            puts "Press Enter to continue playing or enter 'save' to save your progress"
            question = gets

            case
            when question.chomp == "save"
                save_game
                break
            when question == "\n"
                puts "Let's Play!"
                puts "Guess a letter"
                @letter_guess = gets.chomp.downcase.to_s
                puts

                if @letters_guessed.include? letter_guess
                    puts "You already guessed this letter. Please choose another one"
                else

                    @letters_guessed << letter_guess

                    if @hangman.include? letter_guess
                        @word = good_guess
                        puts "Number of attempts left: #{@mistakes}"
                    else
                        @mistakes = @mistakes - 1 
                        puts "Letter not included" 
                        puts "Number of attempts left: #{@mistakes}"
                        @i+=1
                    end
                        
                    gallow

                    win

                end
            end
        end

    end

end

game = Game.new
game.play