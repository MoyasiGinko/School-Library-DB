# class_student.rb

require './class_person' # Import the Person class from the class_person file

class Student < Person
  attr_accessor :classroom # Add this line to declare the classroom variable as an accessor

  def initialize(age, classroom, name = 'Unknown', parent_permission: false)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯' # Return a fun string to represent playing hooky
  end
end
