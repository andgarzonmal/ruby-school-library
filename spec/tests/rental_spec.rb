require_relative '../../library/rental'
require_relative '../../library/book'
require_relative '../../library/person'

describe Book do 
  book = Book.new("Game of thrones", "George RR Martin") 
  person = Person.new(35, 'Andres', 20, parent_permission: true)
  date = '31-08-2022'
  rental = Rental.new(date, person, book)
  
  it 'Rental contains book, person, date' do
    expect(rental).to be_instance_of Rental
  end

  it 'Rental parameeter that contains book' do 
    expect(rental.book).to eq(book)
  end

  it 'Rental parameeter that contains date' do
    expect(rental.date).to eq('31-08-2022')
  end

  it 'Rental parameeter that contains date' do
    expect(rental.person).to eq(person)
  end
end
