require_relative '../../library/capitalize_decorator'
require_relative '../../library/person'

describe CapitalizeDecorator do
  person = Person.new(35, 'andres', 20, parent_permission: true)
  capitalized = CapitalizeDecorator.new(person)

  it 'capitalized is an instance' do
    expect(capitalized).to be_instance_of CapitalizeDecorator
  end

  it 'returns the person name capitalized' do
    expect(capitalized.correct_name).to eq('Andres')
  end
end
