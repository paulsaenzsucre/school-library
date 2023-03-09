require_relative 'decorator_base'

class TrimmerDecorator < DecoratorBase
  def correct_name
    @nameable.correct_name.size > 10 ? @nameable.correct_name[0, 10] : @nameable.correct_name
  end
end
