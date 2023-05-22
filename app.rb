require './student'
require './person'
require './book'
require './teacher'
require './rental'
require './actions'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts 'There is no book.'
      return
    end
    @books.each do |book|
      puts "Title: #{book.title} , Author: #{book.author}"
    end
  end

  def list_people
    if @people.empty?
      puts 'There are no people.'
      return
    end
    display_people(@people)
  end

  def display_people(people)
    people.each do |p|
      puts "[#{p.class}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}"
    end
  end

  def create_person
    person_type_input = Actions.new
    input = person_type_input.select_person_type
    case input
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid input, person not created'
    end
  end

  def create_student
    get_input = Actions.new
    age = get_input.get_input('Age: ', :to_i)
    name = get_input.get_input('Name: ')
    permission = get_input.get_input('Has parent permission? [Y/N]:  ', :downcase)
    @people << Student.new(age, name, parent_permission: permission)
    puts 'Student created successfully!'
  end

  def create_teacher
    get_input = Actions.new
    age = get_input.get_input('Age: ', :to_i)
    name = get_input.get_input('Name: ')
    specialization = get_input.get_input('Specialization:  ')
    @people << Teacher.new(age, name, specialization: specialization)
    puts 'Teacher created successfully!'
  end

  def create_book
    get_input = Actions.new
    title = get_input.get_input('Title:')
    author = get_input.get_input('Author:')
    @books << Book.new(title, author)
    puts 'Book created successfuly!'
  end

  def create_rental
    get_input = Actions.new
    if @books.empty?
      puts 'No book record found'
    elsif @people.empty?
      puts 'No person record found'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end

      book_index = get_input.get_input('Book Index: ', :to_i)

      puts 'Select a person from the following list by number (not ID)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end

      person_index = get_input.get_input('List Number: ', :to_i)

      date = get_input.get_input('Date: ')

      @rentals << Rental.new(date, @books[book_index], @people[person_index])
      puts 'Rental created successfully'
    end
  end

  def list_rentals
    get_input = Actions.new
    id = get_input.get_input('ID of person: ', :to_i)

    rentals = @rentals.filter { |rental| rental.person.id == id }

    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
