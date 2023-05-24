require_relative '../book'
require_relative '../rental'
require_relative '../person'

RSpec.describe Rental do
  date = '22/03/2023'
  book = Book.new('Watchmen', 'Ala Moore')
  person = Person.new(25, 'Aman')
  subject(:rental) { described_class.new(date, book, person) }

  describe '#date' do
    it 'returns the correct date' do
      expect(rental.date).to eq '22/03/2023'
    end
  end

  describe '#book-title' do
    it 'returns the correct book title' do
      expect(rental.book.title).to eq 'Watchmen'
    end
  end

  describe '#book-author' do
    it 'returns the correct book author' do
      expect(rental.book.author).to eq 'Ala Moore'
    end
  end

  describe '#person-name' do
    it 'returns the correct person name' do
      expect(rental.person.name).to eq 'Aman'
    end
  end

  describe '#person-age' do
    it 'returns the correct person age' do
      expect(rental.person.age).to eq 25
    end
  end
end