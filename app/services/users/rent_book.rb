module Users
  class RentBook < ApplicationService
    param :current_user
    param :book_id, type: proc(&:to_i)

    def call
      rentedBooksCount = Users::RentedBooks.call(current_user).value![:count]

      return Failure(errors: [ErrorsMessage::RENTED_BOOK_LIMIT_EXCEED]) unless Users::RentedBooks::LIMIT > rentedBooksCount

      book = Book.find_by_id(book_id)

      return Failure(errors: [ErrorsMessage::NOT_FOUND_BOOK]) unless book
      return Failure(errors: [ErrorsMessage::ALREADY_RENTED_BOOK]) if book.rent_by == current_user
      return Failure(errors: [ErrorsMessage::NOT_AVAILIABLE_BOOK]) unless book.available?
      
      book.update(rent_by: current_user)
      rented_books = Users::RentedBooks.call(current_user).value![:books]

      Success(book: book, rented_books: rented_books)
    end
  end
end