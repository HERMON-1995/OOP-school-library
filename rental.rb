class Rental
  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    @person['rentals'] << self
    @book['rentals'] << self
  end

  def to_h
    {
      date: @date,
      book: @book,
      person: @person
    }
  end

  attr_accessor :date, :book, :person
end