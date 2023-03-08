class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(name, parent_permission, age)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
