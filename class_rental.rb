class Rental
  attr_accessor :date, :book, :person

  @all_rentals = []

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    self.class.add_book(self)
  end

  def self.all
    @all_rentals
  end

  def self.add_book(rental)
    @all_rentals << rental
  end
end
