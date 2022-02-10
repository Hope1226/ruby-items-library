class StoreData
  attr_reader :books, :games

  def initialize(books = [], music_albums = [], games = [])
    @books = books
    @music_albums = music_albums
    @games = games
  end

  def fetch_data
    fetch_books
    fetch_music_albums
  end

  def fetch_games_data
    fetch_games
  end

  def books_set(all_books)
    @books = all_books
    File.write('./JSON/books.json', @books)
  end

  def music_albums_set(all_albums)
    @music_albums = all_albums
    File.write('./JSON/music_albums.json', @music_albums)
  end

  def games_set(all_games)
    @games = all_games
    File.write('./JSON/games.json', @games)
  end

  def close_document
    @books_file.close
    @music_albums_file.close
  end

  def close_game_document
    @games_file.close
  end

  # rubocop:disable Metrics/ParameterLists
  def rebuild_objects(item, label, author, genre, labels, authors, genres)
    result = []
    @books.map do |data|
      puts data['label']['title']
      new_book = item.new(data['publisher'], data['cover_state'], data['publish_date'])
      labels << label.new(data['label']['title'], data['label']['color']).add_item(new_book)
      authors << author.new(data['author']['first_name'], data['author']['last_name']).add_item(new_book)
      genres << genre.new(data['genre']['name']).add_item(new_book)
      result << ({
        publisher: new_book.publisher,
        cover_state: new_book.cover_state,
        publish_date: new_book.publish_date,
        label: { title: new_book.label.title, color: new_book.label.color },
        author: { first_name: new_book.author.first_name, last_name: new_book.author.last_name },
        genre: { name: new_book.genre.name }
      })
    end
    result
  end

  def rebuild_objects_music(item, label, author, genre, labels, authors, genres)
    result = []
    @music_albums.map do |data|
      puts data['label']['title']
      new_music_album = item.new(data['on_spotify'], data['publish_date'])
      labels << label.new(data['label']['title'], data['label']['color']).add_item(new_music_album)
      authors << author.new(data['author']['first_name'], data['author']['last_name']).add_item(new_music_album)
      genres << genre.new(data['genre']['name']).add_item(new_music_album)
      result << ({
        on_spotify: new_music_album.on_spotify,
        publish_date: new_music_album.publish_date,
        label: { title: new_music_album.label.title, color: new_music_album.label.color },
        author: { first_name: new_music_album.author.first_name, last_name: new_music_album.author.last_name },
        genre: { name: new_music_album.genre.name }
      })
    end
    result
  end

  def rebuild_games_objects(game, label, author, genre, labels, authors, genres)
    result = []
    @games.map do |data|
      puts data['label']['title']
      new_game = game.new(data['last_played_at'], data['multiplayer'], data['publish_date'])
      labels << label.new(data['label']['title'], data['label']['color']).add_item(new_game)
      authors << author.new(data['author']['first_name'], data['author']['last_name']).add_item(new_game)
      genres << genre.new(data['genre']['name']).add_item(new_game)
      result << ({
        last_played_at: new_game.last_played_at,
        multiplayer: new_game.multiplayer,
        publish_date: new_game.publish_date,
        label: { title: new_game.label.title, color: new_game.label.color },
        author: { first_name: new_game.author.first_name, last_name: new_game.author.last_name },
        genre: { name: new_game.genre.name }
      })
    end
    result
  end
  # rubocop:enable Metrics/ParameterLists

  private

  def fetch_books
    exist = File.exist?('./JSON/books.json')
    @books_file = File.open('./JSON/books.json', 'w') unless exist
    @books_file = File.open('./JSON/books.json')
    @books = if File.zero?(@books_file)
               []
             else
               JSON.parse(@books_file.read)
             end
  end

  def fetch_music_albums
    exist = File.exist?('./JSON/music_albums.json')
    @music_albums_file = File.open('./JSON/music_albums.json', 'w') unless exist
    @music_albums_file = File.open('./JSON/music_albums.json')
    @music_albums = if File.zero?(@music_albums_file)
                      []
                    else
                      JSON.parse(@music_albums_file.read)
                    end
  end

  def fetch_games
    exist = File.exist?('./JSON/games.json')
    @games_file = File.open('./JSON/games.json', 'w') unless exist
    @games_file = File.open('./JSON/games.json')
    @games = if File.zero?(@games_file)
               []
             else
               JSON.parse(@games_file.read)
             end
  end
end
