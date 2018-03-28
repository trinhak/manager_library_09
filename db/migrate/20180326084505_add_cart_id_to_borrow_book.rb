class AddCartIdToBorrowBook < ActiveRecord::Migration[5.1]
  def change
    add_column :borrow_books, :cart_id, :integer
  end
end
