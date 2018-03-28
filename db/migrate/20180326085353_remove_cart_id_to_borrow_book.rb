class RemoveCartIdToBorrowBook < ActiveRecord::Migration[5.1]
  def change
    remove_column :borrow_books, :cart_id, :integer
  end
end
