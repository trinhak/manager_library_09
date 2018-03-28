class BorrowBook < ApplicationRecord
  belongs_to :user
  scope :sort_by_alphabet, ->{order created_at: :desc}

  def add_line_items_from_cart cart
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
