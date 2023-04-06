module Users
  class AddFavoriteCategories < ApplicationService
    param :current_user
    param :favorite_categories, type: [proc(&:to_s)]

    def call
      favorite_categories.each do |category| 
        UserFavoriteCategory.create(category: category, user: current_user) if Book::CATEGORIES.include?(category)
      end

      Success()
    end
  end
end