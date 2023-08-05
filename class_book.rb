class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # Method to add a rental to the book's rentals
  def add_rental(rental)
    @rentals.push(rental)
  end
end
