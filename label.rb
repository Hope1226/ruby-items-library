class Label
  attr_accessor :title, :color

  attr_reader :items, :id

  def initialize(title, color)
    @id = rand(1000),
          @title = title,
          @color = color,
          @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
