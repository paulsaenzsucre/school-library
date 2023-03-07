class Teacher < Person
  def initialize(name = 'Unknown', parent_permission = true, age, specialization)
    super(name, parent_permission, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end