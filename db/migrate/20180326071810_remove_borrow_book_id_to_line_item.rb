class RemoveBorrowBookIdToLineItem < ActiveRecord::Migration[5.1]
  def change
    remove_column :line_items, :borrow_book_id, :integer
  end
end
