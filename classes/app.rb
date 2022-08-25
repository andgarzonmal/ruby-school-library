require_relative './teacher'
require_relative './student'
require_relative './book'
require_relative './rental'
require_relative './person'

class App
  attr_reader :books, :rentals, :people

  def initialize(books = [], rentals = [], people = [])
    @books = books
    @rentals = rentals
    @people = people
  end

  def list_all_books
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_all_people
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
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

  def list_all_rentals
    puts 'ID of person: '
    selected_id = gets.chomp.to_i
    list_of_rentals = @rentals.select { |rental| rental.person.id == selected_id }
    list_of_rentals.each { |item| puts "Date: #{item.date}, Book: \"#{item.book.title}\" by #{item.book.author}" }
  end
end
