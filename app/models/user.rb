# frozen_string_literal: true

class User < ApplicationRecord
  require 'securerandom'

  GENDER = %w[Male Female]
  
  validates :full_name, :email, :address, :age, :gender, :password, presence: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, uniqueness: true
  validates :gender, inclusion: User::GENDER

  before_save :downcase_email

  has_secure_password

  private

  def downcase_email
    self.email = email.downcase
  end
end
