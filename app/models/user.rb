class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :author_follow
  has_many :like, dependent: :destroy
  has_many :borrow, dependent: :destroy
  has_many :book_follow, dependent: :destroy
  has_many :rating, dependent: :destroy
  has_many :comment, dependent: :destroy
  validates :email, length: {maximum: Settings.user.email_length},
    format: {with: VALID_EMAIL_REGEX}, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.user.password_length}
  validates :name, presence: true, length: {maximum: Settings.user.name_length}

  has_secure_password
end
