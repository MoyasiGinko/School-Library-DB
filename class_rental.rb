# class_rental.rb
class Rental
  attr_accessor :date, :book, :person

  @all_rentals = []

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    self.class.add_book(self)

    # Add rental to book's rentals to establish the 'belongs-to' association
    book.rentals << self

    # Add rental to person's rentals to establish the 'belongs-to' association
    person.rentals << self
  end

  def self.all
    @all_rentals
  end

  def self.add_book(rental)
    @all_rentals << rental
  end
end
