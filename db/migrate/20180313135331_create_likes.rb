class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :id_object
      t.integer :user_id
      t.string :type

      t.timestamps
    end
  end
end
