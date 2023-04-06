module Users
  class RentedBooks < ApplicationService
    LIMIT = 2

    param :current_user

    def call
      books = Book.where(rent_by: current_user)

      Success(books: books, count: books.count)
    end
  end
end