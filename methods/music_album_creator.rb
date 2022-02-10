require './music_album'
require './author'
require './label'
require './genre'
require './methods/associations'
require './methods/display'
require 'json'

class MusicAlbumCreator
  attr_accessor :music_album_list

  include Display

  def initialize(labels, authors, genres)
    @store = StoreData.new
    @labels = labels
    @authors = authors
    @genres = genres
    @store.fetch_data
    @music_album_list = @store.rebuild_objects(MusicAlbum, Label, Author, Genre, @labels, @authors, @genres)
  end

  def add_music_album
    author_first_name, author_last_name, title, color, genre, publish_date, on_spotify = dis_main('music_album')
    new_music_album = MusicAlbum.new(on_spotify, publish_date)
    @authors << Author.new(author_first_name, author_last_name).add_item(new_music_album)
    @labels << Label.new(title, color).add_item(new_music_album)
    @genres << Genre.new(genre).add_item(new_music_album)
    @music_album_list << ({
      on_spotify: music_album_list.on_spotify,
      cover_state: music_album_list.cover_state,
      publish_date: music_album_list.publish_date,
      label: { title: music_album_list.label.title, color: music_album_list.label.color },
      author: { first_name: music_album_list.author.first_name, last_name: music_album_list.author.last_name },
      genre: { name: music_album_list.genre.name }
    })
    @store.music_albums_set(JSON.generate(@music_album_list))
  end

  def show_music_album
    if @music_album_list.empty?
      puts '( No music albums found )'
    else
      @music_album_list.each_with_index.map do |mus_alb, i|
        puts "Music Album [#{i + 1}]
        Author: #{mus_alb[:author][:first_name]} #{mus_alb[:author][:last_name]}
        Genre: #{mus_alb[:genre][:name]} Label title: #{mus_alb[:label][:title]}
        On Spotify: #{mus_alb[:on_spotify]}
        Publish date: #{mus_alb[:publish_date]}"
      end
    end
  end
end
