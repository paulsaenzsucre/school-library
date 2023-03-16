require_relative './../classes/trimmer_decorator'
require_relative './../classes/person'

describe '#correct_name' do
  person = Person.new(23, 'JhonHasAVeryLongName', 123, parent_permission: true)
  correct_size = TrimmerDecorator.new(person)
  it 'returns name with a correct size' do
    expect(correct_size.correct_name).to eql('JhonHasAVe')
  end
end
