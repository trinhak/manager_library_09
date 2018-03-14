class CreateBorrows < ActiveRecord::Migration[5.1]
  def change
    create_table :borrows do |t|
      t.integer :user_id
      t.datetime :borrow_start
      t.boolean :accept

      t.timestamps
    end
  end
end
