# main.rb (Refactored)
require_relative 'app'

def create_sample_data(app)
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
  app.create_person(43, 'Henry', 'teacher', nil, parent_permission: true)
end

def handle_option(app, option)
  option_actions = {
    1 => -> { app.list_all_books },
    2 => -> { app.list_all_people },
    3 => -> { app.create_person_option },
    4 => -> { app.create_book_option },
    5 => -> { app.create_rental_option },
    6 => -> { app.list_rentals_for_person_option }
  }

  if option_actions.key?(option)
    option_actions[option].call
  elsif option == 7
    return true # Exit the loop
  else
    puts 'Invalid option. Try again.'
  end

  false # Continue the loop
end

def main
  app = App.new
  create_sample_data(app)

  loop do
    app.menu
    option = gets.chomp.to_i

    break if handle_option(app, option)
  end
end

# Call the main method
main
