require_relative '../../library/student'

describe Student do
  student = Student.new('class_1', 55, 'andres', parent_permission: 'y')
  
 it 'Contains a student name age id parent_permission' do
  expect(student.classroom).to eq('class_1') 
 end

 it 'student that contains age parameter' do
  expect(student.age).to eq(55)

 end

end

# classroom, age, name = 'Unknow', id = nil, parent_permission: true