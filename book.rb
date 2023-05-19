class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
    @rentals << rental  # Introduce a bug by appending the rental twice
    @rentals << rental
  end
  attr_accessor :title, :author, :rentals
end
