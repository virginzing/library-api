require 'rails_helper'

RSpec.describe Users::RentedBooks, type: :service do
  it 'return success and list of books and count' do
    service = Users::RentedBooks.call(@current_user)
  
    rented_books = [@rented_book]

    expect(service[:success]).to eq(true)
    expect(service[:books]).to eq(rented_books)
    expect(service[:count]).to eq(rented_books.count)
  end
end