class User < ApplicationRecord
  has_many :author_follow
  has_many :like, dependent: :destroy
  has_many :borrow, dependent: :destroy
  has_many :book_follow, dependent: :destroy
  has_many :rating, dependent: :destroy
  has_many :comment, dependent: :destroy
end
