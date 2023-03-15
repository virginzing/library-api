# frozen_string_literal: true

class Book < ApplicationRecord
  CATEGORIES = %w[romance fiction poetry economy humor horror]

  validates :title, :author, :category, presence: true
end
