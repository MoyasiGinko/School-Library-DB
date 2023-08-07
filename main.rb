# main.rb (Refactored)
require_relative 'app'
require './handle_options'

def main
  app = App.new
  app.create_sample_data(app)

  loop do
    app.menu
    option = gets.chomp.to_i

    break if handle_option(app, option)
  end
end

# Call the main method
main
