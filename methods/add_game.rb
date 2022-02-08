require '../game'
require 'list_authors'
require 'date'

class AddGame 
    def initialize
        @games = []
    end

    def validate?(date)
        Date.iso8601(date.to_s)
        true
     rescure ArgumentError
        false
    end

    def validate_date(date)
        if validate?(date)
            date
        else
            print 'Please add a valid format [YYYY-MM-DD]'
            answer_date = gets.chomp
            validate_date(answer_date)
        end
    end

    def game_info
        print 'Last played at [YYYY-MM-DD]'
        played_answer = gets.chomp
        last_played_at = played_answer

        print 'Multiplayer [Y/N]'
        multiplayer_answer = gets.chomp.downcase
        multiplayer = is_multiplayer?(multiplayer_answer)

        print 'Publish date [YYYY-MM-DD]'
        date_answer = gets.chomp
        publish_date = validate_date(date_answer)

        [last_played_at, multiplayer, publish_date]
    end

    def add_game 
        last_played_at, multiplayer, publish_date = game_info #Method call
        game = Game.new(last_played_at, multiplayer, publish_date)
        @games << game
        puts 'Game created successfully'
    end

    def is_multiplayer?(multiplayer_answer)
        case multiplayer_answer
        when 'n'
            false
        when 'y'
            true
        else
            print 'Please specify your answer with [Y/N]'
            new_answer = gets.chomp.downcase
            is_multiplayer?(new_answer)
        end
    end

    def author_game 
        list_author
        print 'Select your Author: '
        author_answer = gets.chomp.to_i
        @authors[author_answer]
    end

    def list_games 
        puts 'Your list of games: '
        puts 'You game list is empty' if @games.empty?
        @games.each { |game| puts game}        
    end
end