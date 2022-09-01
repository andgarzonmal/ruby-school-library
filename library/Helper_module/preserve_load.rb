require 'json'
require_relative '../teacher'
require_relative '../student'
require_relative '../book'
require_relative '../rental'
require_relative '../person'

module PreserveLoad
  def store_all_books
    data = @books.map { |book| { title: book.title, author: book.author } }
    File.write('library/Data/books.json', JSON.pretty_generate(data))
  end

  def store_all_people
    data = @people.map do |person|
      if person.instance_of?(Student)
        { class: person.class, name: person.name, age: person.age, id: person.id,
          parent_permission: person.parent_permission }
      elsif person.class != Student
        { class: person.class, age: person.age, name: person.name, specialization: person.specialization,
          id: person.id }
      end
    end
    File.write('library/Data/people.json', JSON.pretty_generate(data))
  end

  def store_all_rentals
    data = @rentals.map do |rental|
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
    File.write('library/Data/rentals.json', JSON.pretty_generate(data))
  end

  def create_all_books
    @books = []
    if File.exist?('library/Data/books.json')
      file = File.open('library/Data/books.json')
      file_data = file.read
      data_arr = JSON.parse(file_data, symbolize_names: true)
      data_arr.each { |book| @books << Book.new(book[:title], book[:author]) } if data_arr.length.positive?
    else
      data = if @books.length.positive?
               @books.map do |book|
                 { title: book.title, author: book.author }
               end
             else
               []
             end
      file = File.open('library/Data/books.json', 'w')
      file.write(JSON.pretty_generate(data))
      file.close
    end
  end

  def create_all_people
    @people = []
    if File.exist?('library/Data/people.json')
      file = File.open('library/Data/people.json')
      file_data = file.read
      data_arr = JSON.parse(file_data, symbolize_names: true)
      if data_arr.length.positive?
        data_arr.each do |person|
          if person[:class] == 'Student'
            @people << Student.new('clase_1', person[:age], person[:name], person[:id],
                                   parent_permission: person[:parent_permission])
          elsif person[:class] != 'Student'
            @people << Teacher.new(person[:specialization], person[:age], person[:name], person[:id])
          end
        end
      end
    else
      create_people_file
    end
  end

  def create_a_rentals
    @rentals = []
    if File.exist?('library/Data/rentals.json')
      file = File.open('library/Data/rentals.json')
      file_data = file.read
      data_arr = JSON.parse(file_data, symbolize_names: true)
      if data_arr.length.positive?
        data_arr.each do |rental|
          person = @people.find { |per| rental[:person][:id] == per.id }
          book = @books.find { |bo| rental[:book][:title] == bo.title }
          @rentals << Rental.new(rental[:date], person, book)
        end
      end
    else
      create_rentals_file
    end
  end
end
