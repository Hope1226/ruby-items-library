require './methods/book_creator'
require './methods/game_creator'
require './methods/music_album_creator'
require './methods/associations'
require './methods/display'

class Main
  def initialize
    @game_controller = GameCreator.new
    @book_controller = BookCreator.new
    @music_album_controller = MusicAlbumCreator.new
    @associations = Associations.new
  end

  def display_options
    options = [
      'List all books',
      'List all music albums',
      'List of games',
      "List all genres (e.g 'Comedy', 'Thriller')",
      "List all labels (e.g. 'Gift', 'New')",
      "List all authors (e.g. 'Stephen King')",
      'Add a book',
      'Add a music album',
      'Add a game',
      'Exit'
    ]
    puts "\n\n Welcome to our app! \n\n"
    options.each_with_index.map do |option, index|
      puts "[#{index + 1}] #{option}"
    end

    user_input = gets.chomp
    run(user_input)
  end

  def associations_options(input)
    case input
    when '4'
      @associations.show_genres
      display_options
    when '5'
      @associations.show_labels
      display_options
    when '6'
      @associations.show_authors
      display_options
    end
  end

  def add_options(input)
    case input
    when '7'
      @book_controller.add_book(@associations.labels, @associations.authors, @associations.genres)
      display_options
    when '8'
      @music_album_controller.add_music_album(@associations.labels, @associations.authors, @associations.genres)
      display_options
    when '9'
      @game_controller.add_game(@associations.labels, @associations.authors, @associations.genres)
      display_options
    end
  end

  def run(option)
    case option
    when '1'
      @book_controller.show_books
      display_options
    when '2'
      @music_album_controller.show_music_album
      display_options
    when '3'
      @game_controller.show_games
      display_options
    when '4', '5', '6'
      associations_options(option)
    when '7', '8', '9'
      add_options(option)
    when '10'
      puts "\n Thank you for using this app! \n"
    end
  end
end

def run_app
  runapp = Main.new
  runapp.display_options
end

run_app
