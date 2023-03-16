require_relative '../classes/person'
require_relative '../classes/rental'
require_relative '../classes/book'

describe Person do
  person = Person.new(21, 'Kevin')
  person_minor = Person.new(15, 'Yuno')
  book = Book.new('Game of thrones', 'G. Martin')
  rental = Rental.new('2023/03/23', book, person)

  context 'When testing Person Class' do
    it 'should create a Person object' do
      expect(person).to be_instance_of(Person)
      expect(person.name).to eq 'Kevin'
      expect(person.age).to eq 21
    end
  end

  context 'When testing can_use_service method' do
    it 'should return true if age is over 17 or have parent permission' do
      expect(person.can_use_services?).to be true
    end
  end

  context 'When testing can_use_service method' do
    it 'should return true if age is over 17 or have parent permission' do
      expect(person.can_use_services?).to be true
      expect(person_minor.can_use_services?).to be true
    end
  end

  context 'When testing correct_name method' do
    it 'should return the correct name of the person' do
      expect(person.correct_name).to eq 'Kevin'
      expect(person_minor.correct_name).to eq 'Yuno'
    end
  end

  context 'When testing add_rental method' do
    it 'should return array of unique rentals' do
      person.add_rental(rental)
      expect(person.rentals).to eq [rental]
    end
  end

  context 'When testing to_hash method' do
    it 'should return an object' do
      expect(person.to_hash) == { class: person.class, id: person.id, name: person.name, age: person.age,
                                  parent_permission: true }
    end
  end

  context 'When testing to_json method' do
    it 'should return to_hash converte in json format' do
      expect(person.to_json).to eq person.to_hash.to_json
    end
  end
end
