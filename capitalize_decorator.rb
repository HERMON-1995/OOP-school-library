require './decorator'

class CapitilizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
