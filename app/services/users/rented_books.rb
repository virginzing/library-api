module Users
  class RentedBooks < ApplicationService
    LIMIT = 2

    def initialize(current_user)
      @current_user = current_user
    end

    def call
      books = Book.where(rent_by: @current_user)

      Success(books: books, count: books.count)
    end
  end
end