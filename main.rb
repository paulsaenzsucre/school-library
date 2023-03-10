require_relative 'classes/classroom'
require_relative 'classes/student'
require_relative 'classes/person'
require_relative 'classes/book'
require_relative 'classes/rental'

math = Classroom.new('Math')
chem = Classroom.new('Chemistry')
stu = Student.new(16, math, 'Stuart')
rob = Student.new(15, math, 'Robert')

puts "Initial Math students: #{math.student_list}"
puts "Initial Chem students: #{chem.student_list}"

puts ''
puts 'Checks chem.add_student(stu)'
chem.add_student(stu)
puts "Math students: #{math.student_list}"
puts "Chem students: #{chem.student_list}"

puts ''
puts 'Checks rob.add_to_classroom(chem)'
rob.add_to_classroom(chem)
puts "Math students: #{math.student_list}"
puts "Chem students: #{chem.student_list}"

moby = Book.new('Moby Dick', 'Herman Melville')
educated = Book.new('Educated', 'Tara Westover')
rent1 = Rental.new('2022-03-10', moby, rob)
rent2 = Rental.new('2022-03-10', educated, rob)
rent3 = Rental.new('2022-03-20', moby, stu)
rent4 = Rental.new('2022-03-20', educated, stu)

puts ''
puts 'Checks rentals'
puts 'Checks person rentals'
rob.add_rental(rent1)
rob.add_rental(rent2)
stu.add_rental(rent3)
stu.add_rental(rent4)
puts "Robert rentals: #{rob.rental_list}"
puts "Stuart rentals: #{stu.rental_list}"

puts ''
puts 'Checks book rentals'
puts "Moby Dick rentals: #{moby.rental_list}"
puts "Educated rentals: #{educated.rental_list}"
