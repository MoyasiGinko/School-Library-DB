# class_teacher.rb
require_relative 'class_person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name, type, parent_permission: false)
    super(age, name, parent_permission: parent_permission)
    @type = type
    @specialization = 'N/A'
  end

  def can_use_services
    true
  end

  # Override the to_s method to show the teacher's name and specialization
  def to_s
    "#{@name} (#{@type}) - Specialization: #{@specialization}"
  end
end
