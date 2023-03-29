# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :rent_by, optional: true, class_name: 'User'

  CATEGORIES = %w[romance fiction poetry economy humor horror]

  validates :title, :author, :category, presence: true
  validates :category, inclusion: Book::CATEGORIES

  def available?
    rent_by.nil?
  end
end
