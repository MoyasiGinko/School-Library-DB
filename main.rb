# main.rb

require './class_person'
require './class_student'
require './class_teacher'
require './class_nameable'
require './class_decorator'
require './class_capitalize_decorator'
require './class_trimmer_decorator'
require './class_classroom'
require './class_book'
require './class_rental'


# Example usage for Person class:
person = Person.new(13, 'Moyasi_Ginko')
person.name = 'moyasi'
puts '=== Person Information ==='
puts "Name: #{person.name}"
puts "Can use services? #{person.can_use_services}"

# Example usage for Student class:
student = Student.new(15, 'English 101', 'Moyasi_Ginko', parent_permission: false)
puts '=== Student Information ==='
puts "Name: #{student.name}"
puts "Age: #{student.age}"
puts "Classroom: #{student.classroom}"
puts "Can use services? #{student.can_use_services}"
puts "Playing Hooky: #{student.play_hooky}"

# Example usage for Teacher class:
teacher = Teacher.new(43, 'Physics', 'Henry')
puts '=== Teacher Information ==='
puts "Name: #{teacher.name}"
puts "Age: #{teacher.age}"
puts "Specialization: #{teacher.specialization}"
puts "Can use services? #{teacher.can_use_services}"

# example usage for Decorator class
person2 = Person.new(22, 'maximilianus')
puts person2.correct_name

capitalized_person = CapitalizeDecorator.new(person2)
puts capitalized_person.correct_name

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name


# example usage for association
neuro_science = Classroom.new('NeuroScience')
neuro_science.add_student(12, 'John Doe')
neuro_science.add_student(12, 'Jane Smith')

neuro_science.students.map { |s| puts s.name }

person_john = Person.new(23, 'John Doe')
person_jane = Person.new(18, 'Jane Smith')

book_love = Book.new('Loving Intro', 'Author1')
book_build = Book.new("Let's build the world", 'Author1')
book_move = Book.new("Let's go to mars", 'Author2')
book_hate = Book.new('The end of hating story', 'Author2')

Rental.new('2018-2-13', book_love, person_john)
Rental.new('2018-2-13', book_love, person_jane)
Rental.new('2020-3-1', book_build, person_john)
Rental.new('2022-1-19', book_move, person_jane)
Rental.new('2022-8-19', book_hate, person_jane)

book_love.rentals.map { |rent| puts rent.person.name }
person_john.rentals.map { |rent| puts rent.book.title }
person_jane.rentals.map { |rent| puts rent.book.title }
