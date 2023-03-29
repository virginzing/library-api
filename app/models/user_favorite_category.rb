# frozen_string_literal: true

class UserFavoriteCategory < ApplicationRecord
  belongs_to :user

  validates :category, presence: true, inclusion: Book::CATEGORIES
end
