class Associations
  attr_accessor :labels, :authors, :genres

  def initialize
    @labels = []
    @authors = []
    @genres = []
  end

  def show_labels
    # lgic for showing lables goes here
    @labels.map do |label, index|
      puts "#{index}) Title: #{label.title} Color: #{label.color} "
    end
  end

  def show_authors
    # lgic for showing lables goes here
  end

  def show_gendres
    # lgic for showing lables goes here
  end
end
