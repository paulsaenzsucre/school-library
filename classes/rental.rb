class Rental
  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    person.add_rental(self)
    book.add_rental(self)
  end

  def to_hash
    {date: @date, book_title: @book.title, person_id: @person.id}
  end

  def to_json(*option)
    to_hash.to_json
  end

  attr_accessor :date, :book, :person
end
