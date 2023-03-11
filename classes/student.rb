require_relative 'person'

class Student < Person
  def initialize(age, classroom = nil, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    add_to_classroom(classroom)
  end

  attr_accessor :classroom

  def play_hooky
    '¯(ツ)/¯'
  end

  def add_to_classroom(classroom)
    return if classroom == @classroom || classroom.nil?

    @classroom&.students&.delete(self)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end
