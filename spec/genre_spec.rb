require_relative '../genre'

describe 'test a new instance of Genre' do
  before(:each) do
    @new_genre = Genre.new('Romance')
    @new_music_album = MusicAlbum.new(false, '2002-12-31')
  end

  it 'creates a new instance of Genre' do
    expect(@new_genre.name).to eql 'Romance'
  end

  it "'add_item' method adds items to the 'items' array" do
    @new_genre.add_item(@new_music_album)
    expect(@new_genre.items.length).to eql 1
  end

  it 'the new Genre instance transfer the Romance genre to the new music album' do
    @new_genre.add_item(@new_music_album)
    expect(@new_music_album.genre.name).to eql 'Romance'
  end
end
