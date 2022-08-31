require_relative '../../library/teacher'

describe Teacher do 
  teacher = Teacher.new('Developer', 30, 'Ariel')

  it 'Parameters for the instance of teacher' do 
    expect(teacher).to be_instance_of Teacher
  end

  it 'Parameter: name of teacher' do 
    expect(teacher.name).to eq('Ariel')
  end

  it 'Parameter: name of teacher' do 
    expect(teacher.age).to eq(30)
  end

  it 'Parameter: name of teacher' do 
    expect(teacher.can_use_services?).to eq(true)
  end
end
