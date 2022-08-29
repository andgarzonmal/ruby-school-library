class Create_record
  def create_student(people)
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission? [Y/N]'
    permission = gets.chomp
    puts 'Person created successfully'
    people << Student.new('clase_1', age, name, parent_permission: permission.downcase == 'y')
  end

  def create_teacher(people)
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Name: '
    name = gets.chomp
    puts 'Specialization: '
    specialization = gets.chomp
    puts 'Person created successfully'
    people << Teacher.new(specialization, age, name)
  end

  def create_a_person(people)
    puts 'do you want to create a sudent (1) or a teacher (2) [Input the number]:'
    selection = gets.chomp.to_i
    case selection
    when 1
      create_student(people)
    when 2
      create_teacher(people)
    end
  end

  def create_a_book(books)
    puts 'Title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    puts 'Book created successfully'
    books << Book.new(title, author)
  end

  def create_a_rental(books, people, rentals)
    puts 'Select a book from the following list by number'
    books.each_with_index { |book, i| puts "#{i}) Title: \"#{book.title}\", Author: #{book.author}" }
    chosen_book_id = gets.chomp.to_i
    chosen_book = books[chosen_book_id]
    puts 'Select a person from the following list by number'
    people.each_with_index do |person, i|
      puts "[#{i}) #{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    chosen_person_id = gets.chomp.to_i
    chosen_person = people[chosen_person_id]
    puts 'Date: '
    date = gets.chomp
    rentals << Rental.new(date, chosen_person, chosen_book)
    puts 'Rental created successfully'
  end

end