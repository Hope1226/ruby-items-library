require './game'
require './author'
require './label'
require './genre'
require './methods/display'
require './methods/store_data'
require 'date'
require 'json'

class GameCreator
  include Display
  attr_accessor :game_list

  def initialize(labels, authors, genres)
    @store_game = StoreData.new
    @labels = labels
    @authors = authors
    @genres = genres
    @store_game.fetch_games_data
    @game_list = @store_game.rebuild_games_objects(Game, Label, Author, Genre, @labels, @authors, @genres)
  end

  def add_game
    author_first_name, author_last_name, title, color, genre, publish_date,
    last_played_at, multiplayer = dis_main('game')
    new_game = Game.new(last_played_at, multiplayer, publish_date)
    @authors << Author.new(author_first_name, author_last_name).add_item(new_game)
    @labels << Label.new(title, color).add_item(new_game)
    @genres << Genre.new(genre).add_item(new_game)
    @game_list << ({
      last_played_at: new_game.last_played_at,
      multiplayer: new_game.multiplayer,
      publish_date: new_game.publish_date,
      label: { title: new_game.label.title, color: new_game.label.color },
      author: { first_name: new_game.author.first_name, last_name: new_game.author.last_name },
      genre: { name: new_game.genre.name }
    })

    @store_game.games_set(JSON.generate(@game_list))
  end

  def show_games
    if @game_list.empty?
      puts '(No game found)'
    else
      @game_list.each_with_index.map do |game, index|
        puts "Game [#{index + 1}]
            Author: #{game[:author][:first_name]} #{game[:author][:last_name]}
            Game title: #{game[:label][:title]}
            Published date: #{game[:publish_date]}
            Multiplayer: #{game[:multiplayer]}
            Last played at: #{game[:last_played_at]}"
      end
    end
  end
end
