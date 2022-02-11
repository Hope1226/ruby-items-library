require 'date'

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
    puts "Please enter the label (e.g. 'Gift', 'New'): "
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    print "Please enter genre (e.g 'Comedy', 'Thriller'): "
    genre = gets.chomp
    print 'Please enter publish date in a format [ YYYY-MM-DD ]: '
    publish_date = gets.chomp
    validate_date(publish_date)
    [author_first_name, author_last_name, title, color, genre, publish_date]
  end

  def dis_book_data
    print 'Please enter the publisher name: '
    publisher = gets.chomp
    print 'Please enter the cover state [good, medium, bad]: '
    cover_state = gets.chomp
    puts "\n Book has been added successfully"
    [publisher, cover_state]
  end

  def dis_game_data
    print 'Last played at [YYYY-MM-DD]: '
    last_played_at = gets.chomp
    validate_date(last_played_at)
    print 'Multiplayer? [ Yes : NO ]: '
    multiplayer = gets.chomp.downcase
    puts "\n Game has been added successfully"
    [last_played_at, multiplayer]
  end

  def dis_music_data
    print 'On spotify? [ Yes : No ]: '
    result = gets.chomp.downcase.eql?('yes')
    puts "\n Music album has been added successfully"
    result
  end

  def validate?(date)
    Date.iso8601(date.to_s)
    true
  rescue ArgumentError
    false
  end

  def validate_date(date)
    if validate?(date)
      date
    else
      print 'Please add a correct date formart [YYYY-MM-DD]: '
      asnwer_date = gets.chomp
      validate_date(asnwer_date)
    end
  end
end
