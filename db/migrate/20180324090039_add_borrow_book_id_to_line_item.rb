class AddBorrowBookIdToLineItem < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :borrow_book_id, :integer
  end
end
