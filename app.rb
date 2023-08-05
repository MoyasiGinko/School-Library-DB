# app.rb
require './class_person'
require './class_student'
require './class_teacher'
require './class_classroom'
require './class_book'
require './class_rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
    @classrooms = []
  end

  def list_all_books
    puts '=== List of Books ==='
    puts 'Title, Author'
    puts '--------------------------'
    @books.each { |book| puts "#{book.title}, #{book.author}" }
  end

  def create_classroom(label)
    classroom = Classroom.new(label)
    @classrooms << classroom
    puts "Classroom #{classroom.label} has been created."
  end

  def list_all_people
    puts '=== List of People ==='
    puts 'ID, Name, Age, Type, Classroom'
    puts '---------------------------------'
    @people.each do |person|
      type = person.is_a?(Teacher) ? 'Teacher' : 'Student'
      classroom_label = person.is_a?(Student) ? (person.classroom&.label || 'N/A') : 'N/A'
      puts "#{person.id}, #{person.name}, #{person.age}, #{type}, #{classroom_label}"
    end
  end

  def create_person(age, name, type, classroom_label = nil, parent_permission: false)
    classroom = find_classroom_by_label(classroom_label) if classroom_label

    person =
      if type == 'teacher'
        Teacher.new(age, name, 'Teacher', parent_permission: parent_permission)
      else
        Student.new(age, classroom, name, parent_permission: parent_permission)
      end

    @people << person
    puts "#{person.name} (#{type.capitalize}) has been created."
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @books << book
    puts "#{book.title} by #{book.author} has been added to the library."
  end

  def create_rental(date, book_title, person_name)
    book = @books.find { |b| b.title == book_title }
    person = @people.find { |p| p.name == person_name }
    return puts 'Book or person not found.' unless book && person

    rental = person.add_rental(book, date)
    @rentals << rental
    puts "Rental created: #{person.name} rented #{book.title} on #{rental.date}."
  end

  def list_rentals_for_person(person_id)
    person = @people.find { |p| p.id == person_id }
    if person
      puts "=== Rentals for #{person.name} ==="
      puts 'Date, Book Title'
      puts '--------------------------'
      person.rentals.each { |rental| puts "#{rental.date}, #{rental.book.title}" }
    else
      puts "Person with ID #{person_id} not found."
    end
  end

  private

  def find_classroom_by_label(label)
    @classrooms.find { |classroom| classroom.label == label }
  end
end
