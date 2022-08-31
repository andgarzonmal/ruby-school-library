require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknow')
    @specialization = specialization
    super(age, name, parent_permission: true)
  end

  def can_use_services?
    true
  end
end
