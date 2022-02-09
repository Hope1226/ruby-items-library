require_relative '../music_album'

describe 'test a new instance of MusicAlbum' do
  before(:each) do
    @new_music_album = MusicAlbum.new(false, '2002-12-31')
  end

  it 'creates a new instance of MusicAlbum' do
    expect(@new_music_album.on_spotify).to be false
  end

  it "'can_be_archived?' method overwrite the parrent method" do
    @new_music_album.move_to_archived
    expect(@new_music_album.archived).to be false
  end
end
