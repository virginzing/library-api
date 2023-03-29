require 'rails_helper'

RSpec.describe Users::ReturnBook, type: :service do
  it 'return success then update return book when book rented by current user and return rented books' do
    service = Users::ReturnBook.call(@current_user, @rented_book.id)

    expect(service[:success]).to eq(true)
    expect(service[:rented_books].include?(@rented_book)).to eq(false)
  end

  it 'return fail and errors message NOT_FOUND_BOOK when book not found' do
    service = Users::ReturnBook.call(@current_user, @INVALID)

    expect(service[:success]).to eq(false)
    expect(service[:errors].include?(ErrorsMessage::NOT_FOUND_BOOK)).to eq(true)
  end
end