require './book'

describe Book do
  context 'When testing Book class' do
    it 'the book.publisher should return correct book publisher' do
      book_test = Book.new('McMillan', 'good', '2001-12-21')
      expect(book_test.publisher).to eql 'McMillan'
    end

    it "The book.archived after the method move_to_archived is invoked, should return false if the parent's method
    returns false and cover_state equals to 'good'" do
      book_test = Book.new('McMillan', 'good', '2021-12-21') # items that are more 10 years old can be archieved
      book_test.move_to_archived
      expect(book_test.archived).to be false
    end

    it "The book.archived after the method move_to_archived is invoked, should return true if the parent's method
    returns false and cover_state equals to 'bad'" do
      book_test = Book.new('McMillan', 'bad', '2021-12-21') # items that are more 10 years old can be archieved
      book_test.move_to_archived
      expect(book_test.archived).to be true
    end

    it "The book.archived after the method move_to_archived is invoked, should return true if the parent's method
    returns true and cover_state equals to 'bad'" do
      book_test = Book.new('McMillan', 'bad', '2001-12-21') # items that are more 10 years old can be archieved
      book_test.move_to_archived
      expect(book_test.archived).to be true
    end
  end
end
