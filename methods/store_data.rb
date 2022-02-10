class StoreData
  attr_reader :books

  def initialize(books = [], music_albums = [])
    @books = books
    @music_albums = music_albums
  end

  def fetch_data
    fetch_books
    fetch_music_albums
  end

  def books_set(all_books)
    @books = all_books
    File.write('./JSON/books.json', @books)
  end

  def music_albums_set(all_albums)
    @music_albums = all_albums
    File.write('./JSON/music_albums.json', @music_albums)
  end

  def close_document
    @books_file.close
    @music_albums_file.close
  end

  # rubocop:disable Metrics/ParameterLists
  def rebuild_objects(book, label, author, genre, labels, authors, genres)
    result = []
    @books.map do |data|
      puts data['label']['title']
      new_book = book.new(data['publisher'], data['cover_state'], data['publish_date'])
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
    exist = File.exist?('./JSON.music_albums.json')
    @music_albums_file = File.open('./JSON/music_albums.json', 'w') unless exist
    @books_file = File.open('./JSON/music_albums.json')
    @books = if File.zero?(@music_albums_file)
                []
             else
                JSON.parse(@music_albums_file.read)
             end
  end
end
