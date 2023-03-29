require 'rails_helper'

RSpec.describe UserFavoriteCategory, type: :model do
  before(:each) do 
    @valid_user_favorite_category = UserFavoriteCategory.new(
      user: @current_user,
      category: Book::CATEGORIES.sample
    )
  end

  it 'user_favorite_category :user must presence.' do
    expect(@valid_user_favorite_category.valid?).to eq(true)

    @valid_user_favorite_category.user = nil
    expect(@valid_user_favorite_category.valid?).to eq(false)
  end

  it 'user_favorite_category :category must presence.' do
    expect(@valid_user_favorite_category.valid?).to eq(true)

    @valid_user_favorite_category.category = nil
    expect(@valid_user_favorite_category.valid?).to eq(false)
  end

  it 'user_favorite_category :category must be allow list in Book::CATEGORIES.' do
    @valid_user_favorite_category.category = @INVALID
    expect(@valid_user_favorite_category.valid?).to eq(false)
  end
end
