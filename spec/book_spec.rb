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

  describe '#add_rental' do
    let(:person) { double('person') }
    let(:date) { double('date') }

    it 'Create a new Rental object with the given person and date' do
      rental = book.add_rental(person, date)
      expect(rental).to be_an_instance_of Rental
      expect(rental.book).to eq book
      expect(rental.person).to eq person
      expect(rental.date).to eq date
    end

    it 'Add the new rental to the rentals array' do
      book.add_rental(person, date)
      expect(book.rentals.length).to eq 1
      expect(book.rentals.first.book).to eq book
      expect(book.rentals.first.person).to eq person
      expect(book.rentals.first.date).to eq date
    end
  end
end
