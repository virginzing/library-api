module Users
  class RentBook < ApplicationService
    def initialize(current_user, book_id)
      @current_user = current_user
      @book_id = book_id
    end

    def call
      rentedBooksCount = Users::RentedBooks.call(@current_user)[:count]

      return { success: false, errors: [ErrorsMessage::RENTED_BOOK_LIMIT_EXCEED] } unless Users::RentedBooks::LIMIT > rentedBooksCount

      book = Book.find_by_id(@book_id)

      return { success: false, errors: [ErrorsMessage::NOT_FOUND_BOOK] } unless book
      return { success: false, errors: [ErrorsMessage::ALREADY_RENTED_BOOK] } if book.rent_by == @current_user
      return { success: false, errors: [ErrorsMessage::NOT_AVAILIABLE_BOOK] } unless book.available?
      
      book.update(rent_by: @current_user)
      rented_books = Users::RentedBooks.call(@current_user)[:books]

      { success: true, rented_books: rented_books }
    end
  end
end