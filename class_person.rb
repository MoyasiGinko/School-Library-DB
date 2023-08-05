# class_person.rb
require './class_nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: false)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services
    of_age? || @parent_permission
  end

  def correct_name
    name
  end

  def add_rental(book, date)
    rental = Rental.new(date, book, self)
    @rentals << rental
    rental
  end

  private

  def generate_id
    Random.rand(1..1000)
  end

  def of_age?
    @age >= 18
  end
end
