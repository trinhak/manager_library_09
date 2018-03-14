class CreateAuthorFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :author_follows do |t|
      t.integer :author_id
      t.integer :user_id

      t.timestamps
    end
  end
end
