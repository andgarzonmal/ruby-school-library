require_relative './app'

def main # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
  app = App.new
  selection = 0
  while selection != 7
    puts "Welcome to School Library App!
    Please choose an option by entering a number:
      1 - List all books
      2 - List all people
      3 - Create a person
      4 - Create a book
      5 - Create a rental
      6 - List all rentals for a given person id
      7 - Exit"
    print 'Please Enter your selection here:'
    selection = gets.chomp.to_i
    case selection
    when 1
      app.list_all_books
    when 2
      app.list_all_people
    when 3
      app.create_a_person
    when 4
      app.create_a_book
    when 5
      app.create_a_rental
    when 6
      app.list_all_rentals
    when 7
      puts 'Thank you for using this app'
    end
  end
end

main
