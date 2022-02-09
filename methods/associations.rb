class Associations
  attr_accessor :labels, :authors, :genres

  def initialize
    @labels = []
    @authors = []
    @genres = []
  end

  def show_labels
    @labels.each_with_index.map do |label, index|
      puts "[#{index + 1}] Label: #{label.title},  Color: #{label.color} "
    end
  end

  def show_authors
    @authors.each_with_index.map do |author, index|
      puts "[#{index + 1 }] Author: #{author.first_name} #{author.last_name}"
    end
  end

  def show_genres
    @genres.each_with_index.map do |genre, index|
      puts "[#{index + 1}] Genre: #{genre.name}"
    end
  end
end
