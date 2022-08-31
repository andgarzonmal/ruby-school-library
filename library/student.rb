require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'Unknow', id= nil, parent_permission: true)
    @classroom = classroom
    super(age, name, id, parent_permission: parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  # Both ways relationship
  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
