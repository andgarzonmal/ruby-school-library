require_relative './person'

class Students < Person
  def initialize(classroom, age, name = 'Unknow', parent_permission: true)
    @classroom = classroom
    super(age, name, parent_permission: parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
