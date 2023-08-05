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
    @books.each_with_index { |book, index| puts "#{index}, #{book.title}, #{book.author}" }
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
    puts "\nRental created: #{person.name} rented #{book.title} on #{rental.date}."
  end

  def add_rental_date
    print 'Enter the rental date (YYYY-MM-DD): '
    gets.chomp
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

  # Display menu options to the user
  def menu
    puts "\nChoose an option:"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person (by ID)'
    puts '7. Quit'
    print 'Enter the option number: '
  end

  def create_person_option
    print 'Enter age: '
    age = gets.chomp.to_i
    print 'Enter name: '
    name = gets.chomp
    print 'Enter type (student/teacher): '
    type = gets.chomp.downcase
    if type == 'student'
      print 'Enter classroom label: '
      classroom_label = gets.chomp
    else
      classroom_label = nil
    end
    print 'Does the person have parent permission? (true/false): '
    parent_permission = gets.chomp.downcase == 'true'
    create_person(age, name, type, classroom_label, parent_permission: parent_permission)
  end

  def create_book_option
    print 'Enter book title: '
    title = gets.chomp
    print 'Enter book author: '
    author = gets.chomp
    create_book(title, author)
  end

  def create_rental_option
    puts 'Select the book by index:'
    @books.each_with_index { |book, index| puts "#{index + 1}. #{book.title}, #{book.author}" }
    print 'Enter the book index: '
    book_index = gets.chomp.to_i

    puts 'Select the person by index:'
    @people.each_with_index { |person, index| puts "#{index + 1}. #{person.name}" }
    print 'Enter the person index: '
    person_index = gets.chomp.to_i

    book = @books[book_index - 1]
    person = @people[person_index - 1]

    if book && person
      rental_date = add_rental_date
      create_rental(rental_date, book.title, person.name)
    else
      puts 'Book or person not found. Please try again.'
    end
  end

  def list_rentals_for_person_option
    puts "\n---Choose a person by their ID---\n\n"
    list_all_people
    print 'Enter person ID: '
    person_id = gets.chomp.to_i
    list_rentals_for_person(person_id)
  end

  def find_classroom_by_label(label)
    @classrooms.find { |classroom| classroom.label == label }
  end
end
