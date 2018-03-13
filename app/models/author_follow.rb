class AuthorFollow < ApplicationRecord
  has_many :author, dependent: :destroy
  has_many :book, dependent: :destroy
end
