require_relative 'decorator_base'

class CapitalizeDecorator < DecoratorBase
  def correct_name
    @nameable.correct_name.capitalize
  end
end
