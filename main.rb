# main.rb

require './class_person'
require './class_student'
require './class_teacher'
require './class_nameable'
require './class_decorator'
require './class_capitalize_decorator'
require './class_trimmer_decorator'

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
