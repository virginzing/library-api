module Users
  class ReturnBook < ApplicationService
    def initialize(current_user, book_id)
      @current_user = current_user
      @book_id = book_id
    end

    def call
      book = Book.find_by_id(@book_id)

      return { success: false, errors: [ErrorsMessage::NOT_FOUND_BOOK] } unless book&.rent_by == @current_user
      
      book.update(rent_by: nil)
      rented_books = Users::RentedBooks.call(@current_user)[:books]

      { success: true, rented_books: rented_books }
    end
  end
end