require_relative 'classes/app'

def main
  app = App.new
  app.run
  puts 'Thanks for using this app!'
end

def selected_menu_option
  puts '****** SCHOOL LIBRARY ******'
  puts "\nPlease choose an option by entering a number:\n"
  puts '1 - List all books.'
  puts '2 - List all people.'
  puts '3 - Create a person,'
end


def wait_user
  puts 'Press any key to continue...'
  gets.chomp
  puts ''
end

main
