module Users
  class AddFavoriteCategories < ApplicationService
    def initialize(current_user, params)
      @current_user = current_user
      @params = params
    end

    def call
      @params.each do |category| 
        UserFavoriteCategory.create(category: category, user: @current_user) if Book::CATEGORIES.include?(category)
      end

      { success: true }
    end
  end
end