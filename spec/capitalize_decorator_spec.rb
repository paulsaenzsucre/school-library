require_relative '../classes/book'
require_relative '../classes/person'
require_relative '../classes/student'
require_relative '../classes/teacher'
require_relative '../classes/capitalize_decorator'

describe CapitalizeDecorator do
  context 'When testing the correct_name method' do
    it 'should capitalize de Nameable name' do
      person = Person.new(18, 'juan')
      student = Student.new(18, nil, 'pedro')
      teacher = Teacher.new(18, 'Math', 'lucas')
      cap_person = CapitalizeDecorator.new(person)
      cap_student = CapitalizeDecorator.new(student)
      cap_teacher = CapitalizeDecorator.new(teacher)
      expect(cap_person.correct_name).to eq 'Juan'
      expect(cap_student.correct_name).to eq 'Pedro'
      expect(cap_teacher.correct_name).to eq 'Lucas'
    end
  end
end
