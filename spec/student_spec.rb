require_relative '../classes/student'
require_relative '../classes/classroom'

describe Student do
  before :each do
    @student = Student.new(22, nil, 'Ralph Laurent')
  end

  context 'testing methods' do
    it 'Makes a new object' do
      expect(@student).to be_instance_of(Student)
    end

    it '#play_hooky' do
    expect(@student.play_hooky).to eql('¯(ツ)/¯')
    end

    it 'add to a classroom #add_to_classroom' do
      classroom = Classroom.new('Math')
      @student.add_to_classroom(classroom)
      expect(@student.classroom).to eq(classroom)
    end
  end
end