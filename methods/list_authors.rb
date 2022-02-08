# here we should call the author memory, something like require '../save_data/author'

class AuthorList
  def initialize()
    @authors = []
  end

  def list_author
    puts 'Your list of authors:  '
    @authos.each_with_index { |_item, index| puts "#{index}) Author ~ #{author.first_name} #{author.last_name}" }
  end
end
