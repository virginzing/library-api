require 'rails_helper'

RSpec.describe Users::RentedBooks, type: :service do
  it 'return Success and list of books and count' do
    service = Users::RentedBooks.call(@current_user)
  
    rented_books = [@rented_book]

    expect(service.success?).to eq(true)
    expect(service.value![:books]).to eq(rented_books)
    expect(service.value![:count]).to eq(rented_books.count)
  end
end