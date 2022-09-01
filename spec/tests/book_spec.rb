require_relative '../../library/book'

describe Book do
  book = Book.new('Game of thrones', 'George RR Martin')

  it 'book contains title' do
    expect(book.title).to eq('Game of thrones')
  end

  it 'book contains author' do
    expect(book.author).to eq('George RR Martin')
  end

  it 'book contains both arguments' do
    expect(book).to be_instance_of Book
  end
end
