class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = [] # Has many relationship
  end

  # has many relationship
  def add_student(student)
    @students.push(student)
    student.classroom = self # Both ways relationship
  end
end
