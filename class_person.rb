class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: false)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services
    of_age? || @parent_permission
  end

  private

  def generate_id
    Random.rand(1..1000)
  end

  def of_age?
    @age >= 18
  end
end

# Example usage:
person = Person.new(13, 'Moyasi_Ginko')
person.name = 'moyasi'
puts person.name
puts person.can_use_services

