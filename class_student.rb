# class_student.rb

require './class_person' # Import the Person class from the class_person file

class Student < Person
  attr_reader :classroom

  @all_students = []

  def initialize(age, classroom, name = 'Unknown', parent_permission: false)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    self.class.add_student(self)
  end

  def self.all
    @all_students
  end

  def self.add_student(student)
    @all_students << student
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯' # Return a fun string to represent playing hooky
  end
end
