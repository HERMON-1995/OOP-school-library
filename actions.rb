class Actions
  def list_of_actions
    puts "Choose an option from the options down below:\n"
    option = [
      '1 - List all books',
      '2 - List all people',
      '3 - Create a person',
      '4 - Create a book',
      '5 - Create a rental',
      '6 - List all rentals for a given person id',
      '7 - Exit'
    ]
    puts option
  end

  def get_input(prompt, type = :to_s)
    print prompt
    input = gets.chomp
    type == :to_i ? input.to_i : input
  end

  def select_person_type
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    gets.chomp.to_i
  end
end
