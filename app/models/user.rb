# frozen_string_literal: true

class User < ApplicationRecord
  require 'securerandom'

  GENDER = %w[Male Female]
  
  validates :full_name, :email, :address, :age, :gender, :password, presence: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, uniqueness: true
  validates :gender, inclusion: User::GENDER

  before_save :downcase_email

  has_secure_password

  has_many :user_favorite_categories

  def favorite_categories
    user_favorite_categories.map(&:category)
  end 

  private

  def downcase_email
    self.email = email.downcase
  end
end
