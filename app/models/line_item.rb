class LineItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  scope :sort_by_alphabet, ->{order created_at: :desc}
end
