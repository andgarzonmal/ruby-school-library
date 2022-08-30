require 'json'

module preserveLoad
  def store_all_books
    File.write('../Data/books.json', @books.to_json)
  end
  
  def store_all_people
    File.write('../Data/people.json', @people.to_json)
  end

  def store_all_rentals
    File.write('../Data/rentals.json', @people.to_json)
  end
  
end