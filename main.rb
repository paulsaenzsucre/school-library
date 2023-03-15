require_relative 'classes/app'

def main
  app = App.new
  app.run
  puts 'Thanks for using this app!'
end

def selected_menu_option
  puts '****** SCHOOL LIBRARY ******'
  puts "\nPlease choose an option by entering a number:\n"
  MAIN_MENU.each { |key, value| puts "#{key} - #{value[0]}" }
  puts ''
  get_option_selected(1, 7)
end

def get_option_selected(from, to)
  option = ''
  loop do
    print "Select a valid option [#{from} ... #{to}]:?"
    option = gets.chomp.to_i
    break if option >= from && option <= to
  end

  option
end

def wait_user
  puts 'Press any key to continue...'
  gets.chomp
  puts ''
end

main
