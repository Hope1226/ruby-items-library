require './book'
require './author'
require './label'
require './genre'
require './methods/display'
require './methods/store_data'
require 'json'

class BookCreator
  include Display
  attr_reader :book_list

  def initialize(labels, authors, genres)
    @store = StoreData.new
    @labels = labels
    @authors = authors
    @genres = genres
    @store.fetch_data
    @book_list = @store.rebuild_objects(Book, Label, Author, Genre, @labels, @authors, @genres)
  end

  def add_book
    author_first_name, author_last_name, title, color, genre, publish_date, publisher, cover_state = dis_main('book')
    new_book = Book.new(publisher, cover_state, publish_date)
    @authors << Author.new(author_first_name, author_last_name).add_item(new_book)
    @labels << Label.new(title, color).add_item(new_book)
    @genres << Genre.new(genre).add_item(new_book)
    @book_list << ({
      publisher: new_book.publisher,
      cover_state: new_book.cover_state,
      publish_date: new_book.publish_date,
      label: { title: new_book.label.title, color: new_book.label.color },
      author: { first_name: new_book.author.first_name, last_name: new_book.author.last_name },
      genre: { name: new_book.genre.name }
    })

    @store.books_set(JSON.generate(@book_list))
  end

  def show_books
    if @book_list.empty?
      puts '( No books found )'
    else
      @book_list.each_with_index.map do |book, i|
        puts "Book [#{i + 1}]
        Author: #{book[:author][:first_name]} #{book[:author][:last_name]}
        Genre: #{book[:genre][:name]}
        Book title: #{book[:label][:title]}
        publisher: #{book[:publisher]}
        Published date: #{book[:publish_date]}"
      end
    end
  end
end
