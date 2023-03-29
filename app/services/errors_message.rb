module ErrorsMessage
  TOKEN_IS_INVALID = 'token is invalid.'
  UNAUTHORIZED = 'unauthorized.'
  
  RENTED_BOOK_LIMIT_EXCEED = "your rented books must not more #{Users::RentedBooks::LIMIT}."
  ALREADY_RENTED_BOOK = 'you are already rented this book.'
  NOT_AVAILIABLE_BOOK = 'book is not availiable.'
  NOT_FOUND_BOOK = 'book not found.'
end