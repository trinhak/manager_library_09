class CreateBorrowsDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :borrows_details do |t|
      t.integer :borrow_id
      t.integer :book_id
      t.datetime :borrow_end
      t.boolean :status
      t.integer :quantity

      t.timestamps
    end
  end
end
