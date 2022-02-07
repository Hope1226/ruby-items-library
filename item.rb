#create item class
require 'date'

class Item 
    attr_accessor :book, :music_album, :game
    def initialize(id, genre, author, source, label, publish_date, archived = false)
     @id = Random.id(1..500)
     @genre = genre
     @author = author
     @source = source
     @label = label
     @publish_date = publish_date
     @archived = archived
    end

    def move_to_archived 
        @archived = can_be_archived?
    end

 private

    def can_be_archived?
        archived_date = Date.iso8601(@publish_date).next_year(10) #Format date YYYY-MM-DD
        DateTime.now() > archived_date
    end
end




