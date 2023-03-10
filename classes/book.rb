class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author, :rentals

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  def rental_list
    list = '['
    @rentals.each { |rental| list << "\n#{rental.date} | #{rental.book.title} | #{rental.person.name}" }
    list << "\n]"
  end
end
