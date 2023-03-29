require 'rails_helper'

RSpec.describe Book, type: :model do
  before(:each) do 
    @valid_book = Book.new(
      title: 'The Lord of the Rings',
      author: 'J. R. R. Tolkien',
      description: 'epic high-fantasy novel',
      category: Book::CATEGORIES.sample
    )
  end

  it 'book :title must presence.' do
    expect(@valid_book.valid?).to eq(true)

    @valid_book.title = nil
    expect(@valid_book.valid?).to eq(false)
  end

  it 'book :author must presence.' do
    expect(@valid_book.valid?).to eq(true)

    @valid_book.author = nil
    expect(@valid_book.valid?).to eq(false)
  end

  it 'book :category must presence.' do
    expect(@valid_book.valid?).to eq(true)

    @valid_book.category = nil
    expect(@valid_book.valid?).to eq(false)
  end

  it 'book :category must be allow list in Book::CATEGORIES.' do
    @valid_book.category = @INVALID
    expect(@valid_book.valid?).to eq(false)
  end
end
