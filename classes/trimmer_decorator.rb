require_relative 'decorator_base'

class TrimmerDecorator < DecoratorBase
  def correct_name
    @nameable.correct_name[0, 10] if @nameable.correct_name.size > 10
  end
end
