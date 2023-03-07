class Person
  @@person_num = 0

  def initialize(name = 'Unknown', parent_permission = true, age)
    @@person_num += 1
    @id = @@person_num
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name
  attr_accessor :age

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private
    def is_of_age?
      not@age < 18
    end
end