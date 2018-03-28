class AddLineItemIdToBorrowBook < ActiveRecord::Migration[5.1]
  def change
    add_column :borrow_books, :line_item_id, :integer
  end
end
