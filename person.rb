# Person section
require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id, :rentals
  attr_accessor :age, :name

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def to_h
    {
      age: @age,
      name: @name,
      parent_permission: @parent_permission,
      id: @id,
      rentals: @rentals.map(&:to_h)
    }
  end

  def correct_name
    @name
  end
end
