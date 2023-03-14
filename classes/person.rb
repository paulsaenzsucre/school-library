require 'securerandom'
require_relative 'nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  def rental_list
    list = ''
    @rentals.each { |rental| list << "\nDate: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}" }
    list << "\n"
  end

  def to_hash
    {class: self.class, id: @id, name: @name, age: @age, parent_permission: @parent_permission}
  end

  def to_json(*option)
    to_hash.to_json
  end

  private

  def of_age?
    @age >= 18
  end
end
