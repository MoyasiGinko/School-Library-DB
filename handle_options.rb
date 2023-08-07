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
