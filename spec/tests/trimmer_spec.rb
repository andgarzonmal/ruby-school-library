require_relative '../../library/trimmer_decorator'
require_relative '../../library/person'

describe TrimmerDecorator do
  person = Person.new(35, 'maximilianus', 20, parent_permission: true)
  trimmed = TrimmerDecorator.new(person)

  it 'trimmed is an instance' do
    expect(trimmed).to be_instance_of TrimmerDecorator
  end

  it 'returns the person name trimmed' do
    expect(trimmed.correct_name).to eq('maximilian')
  end
end
