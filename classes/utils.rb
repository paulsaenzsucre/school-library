MAIN_MENU = {
  1 => ['List all books.', 'books_list'],
  2 => ['List all people.', 'people_list'],
  3 => ['Create a person,', 'create_person'],
  4 => ['Create a book.', 'create_book'],
  5 => ['Create a rental.', 'create_rental'],
  6 => ['List all rentals for a given person id.', 'person_rentals'],
  7 => ['Exit.', 'save_data']
}.freeze

def load_books(books)
  return unless File.exist?('data/books.json') && File.size?('data/books.json')

  JSON.parse(File.read('data/books.json')).each { |book| books.push(Book.new(book['title'], book['author'])) }
end

def load_people(people)
  return unless File.exist?('data/people.json') && File.size?('data/people.json')

  JSON.parse(File.read('data/people.json')).each do |person|
    if person['class'] == 'Student'
      people.push(Student.new(person['age'], nil, person['name'], person['id'],
                              parent_permission: person['parent_permission']))
    else
      people.push(Teacher.new(person['age'], person['specialization'], person['name'], person['id'],
                              parent_permission: person['parent_permission']))
    end
  end
end

def load_rentals(rentals, people, books)
  return unless File.exist?('data/rentals.json') && File.size?('data/rentals.json')

  JSON.parse(File.read('data/rentals.json')).each do |rental|
    rent_person = people.find { |person| person.id == rental['person_id'] }
    rent_book = books.find { |book| book.title == rental['book_title'] }
    rentals.push(Rental.new(rental['date'], rent_book, rent_person))
  end
end
