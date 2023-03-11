require_relative 'classes/app'

def main
  app = App.new
  app.run
  puts 'Thanks for using this app!'
end

main
