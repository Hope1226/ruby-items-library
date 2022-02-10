require './game'

describe Game do
  before :each do
    @game = [Game.new('2021-02-23', true, '2010-01-30'), Game.new('2021-02-23', true, '2017-01-30')]
  end

  it 'check if game is kind of Item' do
    @game.each do |game|
      expect(game).to be_kind_of Item
    end
  end

  it 'is an instance of the class?' do
    @game.each do |game|
      expect(game).to be_instance_of Game
    end
  end

  it 'check if the game can be archived' do
    can_be_archived = @game[0].send(:can_be_archived?)
    expect(can_be_archived).to be true
  end

  it 'check if the game can not be archived' do
    can_be_archived = @game[1].send(:can_be_archived?)
    expect(can_be_archived).to be false
  end
end
