class AvailableFavoriteCategoryBooksEmailJob
  include Sidekiq::Job

  def perform(*args)
    User.all.each do |user| 
      recommend_books = Book.where(rent_by: nil, category: user.favorite_categories)

      puts("AvailableFavoriteCategoryBooksEmailJob: mail to #{user.email} by categories = #{user.favorite_categories}")

      AvailableFavoriteCategoryBooksMailer.with(user: user, books: recommend_books).recommend_email.deliver_now
    end
  end
end
