require './book'
require './label'

describe Label do
  context 'When testing Book class' do
    it 'label.title should return correct title' do
      test_label = Label.new('new', 'red')
      expect(test_label.title).to eql 'new'
    end

    it 'label.color should return correct color' do
      test_label = Label.new('new', 'red')
      expect(test_label.color).to eql 'red'
    end

    it 'items instance length should be increased by 1 ounce add item method is invoked' do
      test_label = Label.new('new', 'red')
      test_book = Book.new('McMillan', 'bad', '2001-01-21')
      test_label.add_item(test_book)
      expect(test_label.items.length).to eql 1
    end

    it 'times labeb.color should be red add item method is invoked' do
      test_label = Label.new('new', 'red')
      test_book = Book.new('McMillan', 'bad', '2001-01-21')
      test_label.add_item(test_book)
      expect(test_book.label.color).to eql 'red'
    end
  end
end
