class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.datetime :birthday
      t.integer :phone
      t.text :details

      t.timestamps
    end
  end
end
