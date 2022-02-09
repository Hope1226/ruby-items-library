require './book'
require './author'
require './label'
require './genre'
require './methods/display'

class BookCreator
  include Display

  def initialize
    @book_list = []
  end

  def add_book(labels, authors, genres)
    author_first_name, author_last_name, title, color, genre, publish_date, publisher, cover_state = dis_main('book')
    new_book = Book.new(publisher, cover_state, publish_date)
    @book_list << new_book

    authors << Author.new(author_first_name, author_last_name).add_item(new_book)
    labels << Label.new(title, color).add_item(new_book)
    genres << Genre.new(genre).add_item(new_book)
  end

  def show_books
    if @book_list.empty?
      puts '( No books found )'
    else
      @book_list.each_with_index.map do |book, i|
        puts "Book [#{i + 1}]
        Author: #{book.author.first_name} #{book.author.last_name}
        Genre: #{book.genre.name}
        Label title: #{book.label.title}
        publisher: #{book.publisher}
        Published date: #{book.publish_date}"
      end
    end
  end
end
