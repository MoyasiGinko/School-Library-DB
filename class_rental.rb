class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    # Add the rental to the book's rentals
    book.add_rental(self)
    # Add the rental to the person's rentals
    person.add_rental(self)
  end
end
