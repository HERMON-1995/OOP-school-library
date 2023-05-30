require_relative '../person'
require_relative '../book'
require_relative '../rental'

RSpec.describe Person do
  let(:person) { Person.new(18) }
  let(:book) { Book.new('Title', 'Author') }
  let(:date) { '12-02-2023' }

  describe '#initialize' do
    context 'when creating a new Person object' do
      it 'returns a new Person object' do
        expect(person).to be_an_instance_of Person
      end

      it 'assigns the age' do
        expect(person.age).to eq 18
      end

      it 'assigns a default name if no name is given' do
        expect(person.name).to eq 'Unknown'
      end

      it 'assigns parent permission to true by default' do
        expect(person.instance_variable_get(:@parent_permission)).to eq true
      end

      it 'assigns an id between 1 and 1000' do
        expect(person.id).to be_between(1, 1000)
      end

      it 'initializes an empty rentals array' do
        expect(person.rentals).to be_empty
      end
    end
  end

  describe '#of_age?' do
    it 'Return true if age is 18 or greater' do
      expect(person.of_age?).to eq true
    end

    it 'Return false if age is less than 18' do
      person.age = 17
      expect(person.of_age?).to eq false
    end
  end

  describe '#can_use_services?' do
    it 'Return true if age is 18 or greater' do
      expect(person.can_use_services?).to eq true
    end

    it 'Return true if parent permission is granted' do
      person.instance_variable_set(:@parent_permission, true)
      person.age = 15
      expect(person.can_use_services?).to eq true
    end
  end

  describe '#to_h' do
    it 'Return a hash' do
      expected_hash = {
        age: 18,
        id: person.id,
        name: 'Unknown',
        parent_permission: true,
        rentals: []
      }
      expect(person.to_h).to eq(expected_hash)
    end
  end

  describe '#correct_name' do
    it 'Return the correct name of the person' do
      person.name = 'Lolo'
      expect(person.correct_name).to eq('Lolo')
    end

    it 'Returns the default name if no name is given' do
      expect(person.correct_name).to eq('Unknown')
    end
  end

  describe '#add_rental' do
    it 'Creates a new Rental object and adds it to rentals array' do
      rental = person.add_rental(book, date)
      expect(rental).to be_an_instance_of Rental
      expect(rental.date).to eq date
    end

    it 'Associates the rental with the person' do
      rental = person.add_rental(book, date)
      expect(rental.person).to eq person
    end

    it 'Associates the rental with the book' do
      rental = person.add_rental(book, date)
      expect(rental.book).to eq book
    end
  end
end
