require_relative '../classes/classroom'

describe Classroom do
  context 'When testing Classroom class' do
    it 'should create a classroom object with a label a an empty students array' do
      classroom = Classroom.new('Math')
      expect(classroom).to be_instance_of(Classroom)
      expect(classroom.label).to eq 'Math'
      expect(classroom.students).to eq []
    end
  end

  context 'When testing the add_student method' do
    it 'should add a student to the @students attribute' do
      classroom = Classroom.new('Math')
      student = Student.new(22, nil, 'Ralph Laurent')
      classroom.add_student(student)
      expect(classroom.students.length).to eq 1
    end
  end
end
