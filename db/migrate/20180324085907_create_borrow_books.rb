class CreateBorrowBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :borrow_books do |t|
      t.integer :user_id
      t.integer :book_id
      t.datetime :borrow_start
      t.datetime :borrow_end
      t.integer :quantity
      t.boolean :status

      t.timestamps
    end
  end
end
