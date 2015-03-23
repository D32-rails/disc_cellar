class CreateDvds < ActiveRecord::Migration
  def change
    create_table :dvds do |t|
      t.string :genre
      t.integer :year
      t.string :rated
      t.boolean :published

      t.timestamps null: false
    end
  end
end
