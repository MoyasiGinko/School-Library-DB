# class_book.rb
class Book
  attr_accessor :title, :author, :rentals

  @all_books = []

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    self.class.add_book(self)
  end

  def self.all
    @all_books
  end

  def self.add_book(book)
    @all_books << book
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
