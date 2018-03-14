class Author < ApplicationRecord
  has_many :author_follow, dependent: :destroy
  has_many :book, dependent: :destroy
end
