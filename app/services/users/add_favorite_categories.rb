module Users
  class AddFavoriteCategories < ApplicationService
    def initialize(current_user, favorite_categories)
      @current_user = current_user
      @favorite_categories = favorite_categories
    end

    def call
      @favorite_categories.each do |category| 
        UserFavoriteCategory.create(category: category, user: @current_user) if Book::CATEGORIES.include?(category)
      end

      Success()
    end
  end
end