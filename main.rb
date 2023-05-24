require './app'
require './actions'

class Main
  def initialize
    @app = App.new
  end
  puts 'Welcome to School Library'
  def run
    loop do
      actions = Actions.new
      actions.list_of_actions

      input = gets.chomp

      case input.to_i
      when 1
        @app.list_books
      when 2
        @app.list_people
      when 3
        @app.create_person
      when 4
        @app.create_book
      when 5
        @app.create_rental
      when 6
        @app.list_rentals
      when 7
        return
      end
    end
  end
end

main = Main.new
main.run