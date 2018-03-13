class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :book_id
      t.text :content
      t.integer :reply_id

      t.timestamps
    end
  end
end
