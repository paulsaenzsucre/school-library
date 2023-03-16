require_relative '../classes/book'
require_relative '../classes/person'
require_relative '../classes/rental'

describe Book do
  context "When testing the Book Class" do
    it "should create a book object with a title: Book1 and author: Author1" do
      book = Book.new('Book1', 'Author1')
      expect(book).to be_instance_of(Book)
      expect(book.title).to eq 'Book1'
      expect(book.author).to eq 'Author1'
    end
  end

  context "When testing the add_rental method" do
    it "should add a rental object to the @rentals attribute" do
      person = Person.new(18)
      book = Book.new('Book1', 'Author1')
      rental = Rental.new('2023-06-15', book, person)
      person.add_rental(rental)
      expect(book.rentals.length).to eq 1
    end
  end

  context "When testing the to_hash method" do
    it "should create a hash using book attributes" do
      book = Book.new('Book1', 'Author1')
      expected_hash = {title: 'Book1', author: 'Author1'}
      book_to_hash = book.to_hash
      expect(book_to_hash).to eq expected_hash
    end
  end

  context "When testing the to_json"
end