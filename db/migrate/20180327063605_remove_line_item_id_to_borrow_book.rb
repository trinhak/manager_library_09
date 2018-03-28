class RemoveLineItemIdToBorrowBook < ActiveRecord::Migration[5.1]
  def change
    remove_column :borrow_books, :line_item_id, :integer
  end
end
