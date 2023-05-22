require './app'

def main
  loop do
    app = App.new
    puts 'Welcome to School Library'
    puts "\n"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    input = gets.champ

    case input
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      app.reate_rental
    when 6
      app.list_rentals
    when 7
      return
    end
  end
end

main
