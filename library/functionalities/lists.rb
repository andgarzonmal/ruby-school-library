class List
  def list_all_rentals(rentals)
    puts 'ID of person: '
    selected_id = gets.chomp.to_i
    list_of_rentals = rentals.select { |rental| rental.person.id == selected_id }
    list_of_rentals.each { |item| puts "Date: #{item.date}, Book: \"#{item.book.title}\" by #{item.book.author}" }
  end

  def list_all_books(books)
    puts 'entering'
    books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def list_all_people(people)
    people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end
end
