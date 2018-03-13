class Book < ApplicationRecord
  belongs_to :category
  belongs_to :author

  has_many :like, dependent: :destroy
  has_many :borrows_detail, dependent: :destroy
  has_many :book_follow, dependent: :destroy
  has_many :comment, dependent: :destroy
  has_many :rating, dependent: :destroy
end
