require_relative '../book'

RSpec.describe Book do
  let(:book) { Book.new('Thus Spoke Zarathustra', 'Friedrich Nietzsche') }

  describe '#new' do
    it 'Return a new Book object' do
      expect(book).to be_an_instance_of Book
    end
  end

  describe '#title' do
    it 'Return the book title' do
      expect(book.title).to eq 'Thus Spoke Zarathustra'
    end
  end

  describe '#author' do
    it 'Return the book author' do
      expect(book.author).to eq 'Friedrich Nietzsche'
    end
  end

  describe '#rentals' do
    it 'Return an empty array' do
      expect(book.rentals).to be_empty
    end
  end

  # Paste the code here then delete this comment and sorry for not being on time today
end
