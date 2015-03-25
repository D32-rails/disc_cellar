class CreateBorrowships < ActiveRecord::Migration
  def change
    create_table :borrowships do |t|
      t.integer :dvd_id
      t.integer :borrower_id
      t.integer :lender_id
      t.boolean :accepted
      t.boolean :returned

      t.timestamps null: false
    end
  end
end
