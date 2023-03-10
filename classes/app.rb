require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def books_list
    list = ''
    @books.each_with_index { |book, i| list << "\nIndex: #{i} Title: #{book.title}, Author: #{book.author}" }
    list << "\n\n"
  end

  def people_list
    list = ''
    @people.each_with_index do |person, i|
      list << "\nIndex: #{i} [#{person.class}] ID: #{person.id} Name: #{person.name} Age: #{person.age}"
    end
    list << "\n\n"
  end

  def person_rentals
    print 'Input Id of person: '
    id = gets.chomp
    person = @people.find { |per| per.id == id }
    person.nil? ? "There isn't a person with that id\n" : person.rental_list
  end

  def create_rental
    book = selected_book
    person = selected_person
    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, book, person)
    @rentals.push(rental) unless rental.nil?
    puts "\nRental created successfully.\n"
  end

  def selected_person
    puts "\nSelect a person from the following list by index:"
    puts people_list

    option = get_option_selected(0, @people.length - 1)
    @people[option]
  end

  def selected_book
    puts "\nSelect a book from the following list by index:"
    puts books_list

    option = get_option_selected(0, @books.length - 1)
    @books[option]
  end

  def create_book
    puts "\nInput the book data:"
    print 'Input Title: '
    title = gets.chomp
    print 'Input Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
    puts "\nBook created successfully.\n"
  end

  def create_person
    type = person_type
    puts "\nInput the person data:"
    print 'Input Name: '
    name = gets.chomp
    print 'Insert the person age:'
    age = get_option_selected(6, 100)
    permission = permission_assigned

    case type
    when 1
      student = Student.new(age, nil, name, parent_permission: permission)
      @people.push(student)
      puts 'Student created successfully'
    else
      print 'Input Specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(age, specialization, name, parent_permission: permission)
      @people.push(teacher)
      puts "\nTeacher created successfully"
    end
  end

  def person_type
    puts "\nSelect the tipe of person to create:\n"
    puts '[1] Student'
    puts "[2] Teacher\n"

    get_option_selected(1, 2)
  end

  def permission_assigned
    option = ''
    loop do
      print 'Has parent permission [Y/N]:?'
      option = gets.chomp
      if %w[Y y].include?(option)
        option = true
        break
      end

      if %w[N n].include?(option)
        option = false
        break
      end
    end

    option
  end

  def selected_menu_option
    puts '****** SCHOOL LIBRARY ******'
    puts "\nPlease choose an option by entering a number:\n"
    puts '1 - List all books.'
    puts '2 - List all people.'
    puts '3 - Create a person,'
    puts '4 - Create a book.'
    puts '5 - Create a rental.'
    puts '6 - List all rentals for a given person id.'
    puts "7 - Exit.\n"

    get_option_selected(1, 7)
  end

  def get_option_selected(from, to)
    option = ''
    loop do
      print "Select a valid option [#{from} ... #{to}]:?"
      option = gets.chomp.to_i
      break if option >= from && option <= to
    end

    option
  end

  def wait_user
    puts 'Press any key to continue...'
    gets.chomp
    puts ''
  end

  def run
    loop do
      option = selected_menu_option

      case option
      when 1
        puts books_list
      when 2
        puts people_list
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        puts person_rentals
      else
        break
      end

      wait_user
    end
  end
end
