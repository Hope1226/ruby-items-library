class Associations
  attr_accessor :labels, :authors, :genres

  def initialize
    @labels = []
    @authors = []
    @genres = []
  end

  def show_labels
    # lgic for showing lables goes here
    @labels.each_with_index.map do |label, index|
      puts "[#{index + 1}] Label: #{label.title},  Color: #{label.color} "
    end
  end

  def show_authors
    # lgic for showing lables goes here
  end

  def show_genres
    # lgic for showing lables goes here
    @genres.each_with_index.map do |genre, index|
      puts "[#{index + 1}] Genre: #{genre.name}"
    end
  end
end
