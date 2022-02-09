require './game'
require './author'
require './label'
require './genre'
require './methods/display'
require 'date'
require './methods/associations'

class GameCreator
    attr_accessor :game_list
  include Display

  def initialize
    @game_list = []
  end

  def add_game(labels, authors, genres)
    author_first_name, author_last_name, title, color, genre, publish_date, 
    last_played_at, multiplayer = dis_main('game')
    game = Game.new(last_played_at, multiplayer, publish_date)
    @game_list << game

    authors << Author.new(author_first_name, author_last_name).add_item(game)
    labels << Label.new(title, color).add_item(game)
    genres << Genre.new(genre).add_item(game)
  end

  def show_games
    if @game_list.empty?
      puts '(No game found)'
    else
      @game_list.each_with_index.map do |game, index|
        puts "#{index + 1}) Author: #{game.author.first_name} #{game.author.last_name}
            Published date: #{game.publish_date} Multiplayer: #{game.multiplayer} Last played at: #{game.last_played_at}"
      end
    end
  end
end


new_game = GameCreator.new
asso = Associations.new

new_game.add_game(asso.labels, asso.authors, asso.genres)
new_game.game_list
new_game.show_games
asso.show_authors
asso.show_labels