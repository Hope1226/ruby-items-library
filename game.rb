require './item'

class Game < Item
    attr_accessor :last_played_at, :multiplayer
    attr_reader :publish_date

    def initialize(last_played_at, publish_date)
        @last_played_at = last_played_at
        # @multiplayer = multiplayer
        super(publish_date)
    end


    private

    def can_be_archived?
       Date.today > Date.iso8601(@last_played_at).next_year(2) || super
    end
end
