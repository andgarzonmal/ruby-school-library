require_relative '../../library/classroom'
require_relative '../../library/student'
describe Classroom do
  classroom = Classroom.new('class of ruby')
  student = Student.new('class_1', 55, 'andres', parent_permission: 'y')

  it 'classroom is an instance' do
    expect(classroom).to be_instance_of Classroom
  end

  it 'person contains lable' do
    expect(classroom.label).to eq('class of ruby')
  end

  it 'students is an empty array' do
    expect(classroom.students.length).to eq(0)
  end

  it 'add a student' do
    expect(classroom.add_student(student)).not_to be_nil
  end
end
