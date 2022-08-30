require_relative './person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknow')
    @specialization = specialization
    super(age, name, parent_permission: true)
  end

  def can_use_services?
    true
  end
end
