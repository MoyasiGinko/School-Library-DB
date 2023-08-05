class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  # Method to add a student to the classroom
  def add_student(age, name)
    student = Student.new(age, self, name)
    @students << student
    student
  end
end
