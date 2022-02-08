module Display
  def dis_main(obj)
    const_data = dis_constant_data
    case obj
    when 'book'
      const_data + dis_book_data
    when 'music_album'
      const_data << dis_music_data
    when 'game'
      const_data + dis_game_data
    end
  end

  def dis_constant_data
    puts 'Please enter the Author name'
    print 'First Name: '
    author_first_name = gets.chomp
    print 'Last Name: '
    author_last_name = gets.chomp
    print "Please enter the lebl (e.g. 'Gift', 'New'): "
    label = gets.chomp
    print "Please enter genre (e.g 'Comedy', 'Thriller'): "
    genre = gets.chomp
    [author_first_name, author_last_name, label, genre]
  end

  def dis_book_data
    print 'Please enter the publisher name: '
    publisher = gets.chomp
    print 'Please enter the cover state [good, medium, bad]: '
    cover_state = gets.chomp
    [publisher, cover_state]
  end

  def dis_game_data
    print 'Last played at [YYYY-MM-DD]: '
    last_played_at = gets.chomp
    print 'Multiplayer? [ Yes : NO ]: '
    multiplayer = gets.chomp.downcase
    [last_played_at, multiplayer]
  end

  def dis_music_data
    print 'On spotify? [ Yes : No ]: '
    gets.chomp.downcase.eql?('yes')
  end
end
