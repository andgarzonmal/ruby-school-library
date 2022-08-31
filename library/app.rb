require_relative './teacher'
require_relative './student'
require_relative './book'
require_relative './rental'
require_relative './person'
require_relative './functionalities/lists'
require_relative './functionalities/create_record'
require_relative './Helper_module/preserve_load'
require 'json'

class App
  include PreserveLoad
  attr_reader :books, :rentals, :people

  def initialize
    @books = [] if @books.nil?
    @rentals = [] if @rentals.nil?
    @people = [] if @people.nil?
    create_all_books
    create_all_people
    create_a_rentals
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

  def create_people_file
    data = @people.map do |person|
      if person.instance_of?(Student)
        { class: person.class, name: person.name, age: person.age, id: person.id,
          parent_permission: person.parent_permission }
      elsif person.class != Student
        { class: person.class, age: person.age, name: person.name, specialization: person.specialization,
          id: person.id }
      else
        []
      end
    end
    file = File.open('library/Data/people.json', 'w')
    file.write(JSON.pretty_generate(data))
    file.close
  end

  def create_rentals_file
    data = []
    data = if @rentals.length.positive?
             @rentals.map do |rental|
               if rental.person.instance_of?(Student)
                 { date: rental.date,
                   book: { title: rental.book.title, author: rental.book.author },
                   person: { name: rental.person.name, age: rental.person.age, id: rental.person.id,
                             parent_permission: rental.person.parent_permission, class: rental.person.class } }
               elsif rental.person.class != Student
                 { date: rental.date,
                   book: { title: rental.book.title, author: rental.book.author },
                   person: { name: rental.person.name, age: rental.person.age, id: rental.person.id,
                             specialization: rental.person.specialization, class: rental.person.class } }
               end
             end
           end
    file = File.open('library/Data/rentals.json', 'w')
    file.write(JSON.pretty_generate(data))
    file.close
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
        List.new.list_all_people(@people)
      when 3
        CreateRecord.new.create_a_person(@people)
      when 4
        CreateRecord.new.create_a_book(@books)
      when 5
        CreateRecord.new.create_a_rental(@books, @people, @rentals)
      when 6
        List.new.list_all_rentals(@rentals)
      when 7
        puts 'Thank you for using this app'
        store_all_books
        store_all_people
        store_all_rentals
      end
    end
  end
end
