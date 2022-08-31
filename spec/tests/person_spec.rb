require_relative '../../library/person'

describe Person do
  person = Person.new(35, 'Andres', 20, parent_permission: true)

  it 'person contains age' do
    expect(person.age).to eq(35)
  end

  it 'person contains main' do
    expect(person.name).to eq('Andres')
  end

  it 'person contains name method' do
    expect(person.correct_name).to eq('Andres')
  end

  it 'person contains of age method' do
    expect(person.can_use_services?).to eq(true)
  end
end
