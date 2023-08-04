# Purpose: Capitalize the name of the nameable object
require './class_decorator'

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
