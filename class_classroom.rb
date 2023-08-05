# class_classroom.rb

class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end

  # Override the to_s method to show the classroom name
  def to_s
    @label
  end
end
