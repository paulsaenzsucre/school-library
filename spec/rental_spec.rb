require_relative '../classes/person'
require_relative '../classes/rental'
require_relative '../classes/book'

describe Rental do
  person = Person.new(21, 'Kevin')
  book = Book.new('Game of thrones', 'G. Martin')
  rental = Rental.new('2023/03/23', book, person)

  context 'When testing Rental Class' do
    it 'should create a Rental object' do
      expect(rental).to be_instance_of(Rental)
    end
  end

  context 'When testing to_hash method' do
    it 'should return an object' do
      expect(rental.to_hash) == { date: '2023/03/23', book_title: 'Game of thrones', person_id: person.id }
    end
  end

  context 'When testing to_json method' do
    it 'should return to_hash convert to json format' do
      expect(rental.to_json).to eq rental.to_hash.to_json
    end
  end
end
