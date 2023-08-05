class Rental
  attr_accessor :date, :book, :person

  @@all_rentals = []

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    @@all_rentals << self
  end

  def self.all
    @@all_rentals
  end

end
