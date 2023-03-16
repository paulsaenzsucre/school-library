require_relative '../classes/teacher'
require_relative '../classes/classroom'

describe Teacher do
  before :each do
    @teacher = Teacher.new(25, 'History')
  end

  context 'testing methods' do
    it 'Makes a new object' do
      expect(@teacher).to be_instance_of(Teacher)
    end

    it '#can_use_services?' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
