require 'rails_helper'

RSpec.describe Users::RentBook, type: :service do
  it 'return Success then update rented book when book availible and return rented books' do
    service = Users::RentBook.call(@current_user, @availiable_book.id)

    expect(service.success?).to eq(true)
    expect(service.value![:book]).to eq(@availiable_book)
    expect(service.value![:rented_books].include?(@availiable_book)).to eq(true)
  end

  it 'return Failure and errors message NOT_FOUND_BOOK when user already rented book' do
    service = Users::RentBook.call(@current_user, @INVALID)

    expect(service.failure?).to eq(true)
    expect(service.failure[:errors].include?(ErrorsMessage::NOT_FOUND_BOOK)).to eq(true)
  end

  it 'return Failure and errors message RENTED_BOOK_LIMIT_EXCEED when user rented book more than limit' do
    Book.where.not(id: @availiable_book.id).update_all(rent_by_id: @current_user.id)

    service = Users::RentBook.call(@current_user, @availiable_book.id)

    expect(service.failure?).to eq(true)
    expect(service.failure[:errors].include?(ErrorsMessage::RENTED_BOOK_LIMIT_EXCEED)).to eq(true)
  end

  it 'return Failure and errors message ALREADY_RENTED_BOOK when user already rented book' do
    service = Users::RentBook.call(@current_user, @rented_book.id)

    expect(service.failure?).to eq(true)
    expect(service.failure[:errors].include?(ErrorsMessage::ALREADY_RENTED_BOOK)).to eq(true)
  end

  it 'return Failure and errors message NOT_AVAILIABLE_BOOK when book is not availiable' do
    service = Users::RentBook.call(@current_user, @unavailiable_book.id)

    expect(service.failure?).to eq(true)
    expect(service.failure[:errors].include?(ErrorsMessage::NOT_AVAILIABLE_BOOK)).to eq(true)
  end
end