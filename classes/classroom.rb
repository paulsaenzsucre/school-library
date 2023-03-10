class Classroom
  def initialize(label)
    @label = label
    @students = []
  end

  attr_accessor :label, :students

  def add_student(student)
    old_classroom = student.classroom
    old_classroom&.students&.delete(student)
    @students.push(student) unless @students.include?(student)
    student.classroom = self
  end

  def student_list
    list = '['
    @students.each { |student| list << "#{student.name}, " }
    list << ']'
  end
end
