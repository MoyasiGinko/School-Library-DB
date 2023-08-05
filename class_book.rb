#class_book.rb

class Book
  attr_accessor :title, :author, :rentals

  @@all_books = []

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @@all_books << self
  end


  def self.all
    @@all_books
  end

  # Method to add a rental to the book's rentals
  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
