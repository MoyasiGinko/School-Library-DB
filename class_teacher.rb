# class_teacher.rb
require './class_person'

class Teacher < Person
  attr_accessor :specialization # Add this line to define the specialization attribute

  def initialize(age, specialization, name = 'Unknown', parent_permission: false) # Update parent_permission to false
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end