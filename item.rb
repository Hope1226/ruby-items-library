require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived

  def initialize(publish_date)
    @id = Random.rand(1..500)
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archived
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    archived_date = Date.iso8601(@publish_date).next_year(10) # Format date YYYY-MM-DD
    DateTime.now > archived_date
  end
end
