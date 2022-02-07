class Label
  attr_accessor :title, :color

  attr_reader :books, :id

  def initialize(title, color)
    @id = rand(1000),
    @title = title,
    @color = color,
    @books = []
  end

  def add_book(book)
    @books << book
    book.label = self
  end
end
