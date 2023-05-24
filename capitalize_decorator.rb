require_relative './decorator'

class CapitilizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end