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

# Example usage for association between classes
neuro_science = Classroom.new('NeuroScience')
student1 = Student.new(12, neuro_science, 'John Doe')
student2 = Student.new(12, neuro_science, 'Jane Smith')

person_john = Person.new(23, 'John Doe')
person_jane = Person.new(18, 'Jane Smith')

# Create some books
book_love = Book.new('Loving Intro', 'Author1')
book_build = Book.new("Let's build the world", 'Author1')
book_move = Book.new("Let's go to mars", 'Author2')
book_hate = Book.new('The end of hating story', 'Author2')

# Create some rentals
Rental.new('2018-2-13', book_love, person_john)
Rental.new('2018-2-13', book_love, person_jane)
Rental.new('2020-3-1', book_build, person_john)
Rental.new('2022-1-19', book_move, person_jane)
Rental.new('2022-8-19', book_hate, person_jane)

# Create arrays to store instances
books_list = Book.all
students_list = Student.all
rentals_list = Rental.all

# List of books
puts '=== List of Books ==='
puts 'Title, Author'
puts '--------------------------'
books_list.each { |book| puts "#{book.title}, #{book.author}" }

# List of students
puts "\n=== List of Students ==="
puts 'Name, Age, Classroom'
puts '--------------------------'
students_list.each { |student| puts "#{student.name}, #{student.age}, #{student.classroom}" }

# List of rentals
puts "\n=== List of Rentals ==="
puts 'Date, Book Title, Person Name'
puts '----------------------------------'
rentals_list.each { |rental| puts "#{rental.date}, #{rental.book.title}, #{rental.person.name}" }