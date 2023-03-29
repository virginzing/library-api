require 'rails_helper'

RSpec.describe Users::AddFavoriteCategories, type: :service do
  it 'return success then create UserFavoriteCategory given data filtered allow categories' do
    categories = Book::CATEGORIES.sample(2) + [@INVALID]
    service = Users::AddFavoriteCategories.call(@current_user, categories)

    expect(service[:success]).to eq(true)
    expect(UserFavoriteCategory.where(user: @current_user, category: categories).map(&:category)).to eq(categories - [@INVALID])
  end
end