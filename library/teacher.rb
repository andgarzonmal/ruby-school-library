require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknow', id = nil)
    @specialization = specialization
    super(age, name, id, parent_permission: true)
  end

  def can_use_services?
    true
  end
end
