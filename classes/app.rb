require_relative './teacher'
require_relative './student'
require_relative './book'
require_relative './rental'
require_relative './person'
require_relative './functionalities/lists'

class App
  attr_reader :books, :rentals, :people

  def initialize(books = [], rentals = [], people = [])
    @books = books
    @rentals = rentals
    @people = people
  end

  def run
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
  end

  def display # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength
    selection = 0
    while selection != 7
      run
      selection = gets.chomp.to_i
      case selection
      when 1
        List.new.list_all_books(@books)
      when 2
        List.new.app.list_all_people(@people)
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

  def create_student
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [Y/N]'
    permission = gets.chomp
    puts 'Person created successfully'
    @people << Student.new('clase_1', age, name, parent_permission: permission.downcase == 'y')
  end

  def create_teacher
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Name: '
    name = gets.chomp
    puts 'Specialization: '
    specialization = gets.chomp
    puts 'Person created successfully'
    @people << Teacher.new(specialization, age, name)
  end

  def create_a_person
    puts 'do you want to create a sudent (1) or a teacher (2) [Input the number]:'
    selection = gets.chomp.to_i
    case selection
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_a_book
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    puts 'Book created successfully'
    @books << Book.new(title, author)
  end

  def create_a_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, i| puts "#{i}) Title: \"#{book.title}\", Author: #{book.author}" }
    chosen_book_id = gets.chomp.to_i
    chosen_book = @books[chosen_book_id]
    puts 'Select a person from the following list by number'
    @people.each_with_index do |person, i|
      puts "[#{i}) #{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    chosen_person_id = gets.chomp.to_i
    chosen_person = @people[chosen_person_id]
    puts 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, chosen_person, chosen_book)
    puts 'Rental created successfully'
  end
end
