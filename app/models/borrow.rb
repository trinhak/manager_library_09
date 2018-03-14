class Borrow < ApplicationRecord
  belongs_to :user

  has_many :borrows_detail
end
