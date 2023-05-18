require './student'
require './person'
require './book'
require './teacher'
require './rental'

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
    @people.each do |p|
      puts "[#{p.class}] Name: #{p.name}, ID: #{p.id}, Age: #{p.age}"
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    input = gets.chomp.to_i

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
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]:  '
    permission = gets.chomp.downcase
    @people << Student.new(age, name, parent_permission: permission)
    puts 'Student created successfully!'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization:  '
    specialization = gets.chomp
    @people << Teacher.new(age, name, specialization: specialization)
    puts 'Teacher created successfully!'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfuly!'
  end

  def create_rental
    if @books.empty?
      puts 'No book record found'
    elsif @people.empty?
      puts 'No person record found'
    else
      puts 'Select a book from the following list by number'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: #{book.title}, Author: #{book.author}"
      end

      book_index = gets.chomp.to_i

      puts 'Select a person from the following list by number (not ID)'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end

      person_index = gets.chomp.to_i

      print 'Date: '
      date = gets.chomp

      @rentals << Rental.new(date, @books[book_index], @people[person_index])
      puts 'Rental created successfully'
    end
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i

    rentals = @rentals.filter { |rental| rental.person.id == id }

    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end
