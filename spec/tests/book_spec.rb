require_relative '../../library/book'

describe 'book is created' do 
  book = Book.new("Game of thrones", "George RR Martin") 
  
  it 'book contains title' do
    expect(book.title).to eq("Game of thrones")
  end

  it 'book contains author' do 
    expect(book.author).to eq("George RR Martin")
  end

  it 'book contains both arguments' di 
    expect(book).to be_instance_of 
  end
end
