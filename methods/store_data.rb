class StoreData
  attr_reader :books

  def initialize(books = [])
    @books = books
  end

  def fetch_data
    fetch_books
  end

  def books_set(all_books)
    @books = all_books
    File.write('./JSON/books.json', @books)
  end

  def close_document
    @books_file.close
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
end
