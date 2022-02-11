require './author'

describe Author do
  before :each do
    @author = Author.new('Luis', 'Hernesto')
  end

  it 'An author should have a first name' do
    expect(@author.first_name).to eql 'Luis'
  end

  it 'an Author should have last name' do
    expect(@author.last_name).to eql 'Hernesto'
  end
end
