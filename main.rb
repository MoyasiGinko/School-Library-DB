# main.rb
require_relative 'app'

def main
  app = App.new

  # Create some classrooms
  app.create_classroom('NeuroScience')
  app.create_classroom('Math 101')

  # Create some books
  app.create_book('Loving Intro', 'Author1')
  app.create_book("Let's build the world", 'Author1')
  app.create_book("Let's go to mars", 'Author2')
  app.create_book('The end of hating story', 'Author2')

  # Create some people
  app.create_person(23, 'John Doe', 'student', 'NeuroScience')
  app.create_person(18, 'Jane Smith', 'student', 'Math 101')
  app.create_person(43, 'Henry', 'teacher', nil, parent_permission: true) # Don't specify classroom for teacher

  # Create some rentals
  app.create_rental('2018-2-13', 'Loving Intro', 'John Doe')
  app.create_rental('2018-2-13', 'Loving Intro', 'Jane Smith')
  app.create_rental('2020-3-1', "Let's build the world", 'John Doe')
  app.create_rental('2022-1-19', "Let's go to mars", 'Jane Smith')
  app.create_rental('2022-8-19', 'The end of hating story', 'Jane Smith')

  loop do
    puts "\nChoose an option:"
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person (by ID)'
    puts '7. Quit'
    print 'Enter the option number: '
    option = gets.chomp.to_i

    case option
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
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
      app.create_person(age, name, type, classroom_label, parent_permission: parent_permission)
    when 4
      print 'Enter book title: '
      title = gets.chomp
      print 'Enter book author: '
      author = gets.chomp
      app.create_book(title, author)
    when 5
      print 'Enter rental date: '
      date = gets.chomp
      print 'Enter book title: '
      book_title = gets.chomp
      print 'Enter person name: '
      person_name = gets.chomp
      app.create_rental(date, book_title, person_name)
    when 6
      print 'Enter person ID: '
      person_id = gets.chomp.to_i
      app.list_rentals_for_person(person_id)
    when 7
      break
    else
      puts 'Invalid option.'
    end
  end
end

# Call the main method
main
