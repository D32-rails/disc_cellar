class CreateJoinTableDvdUser < ActiveRecord::Migration
  def change
    create_join_table :dvds, :users do |t|
      t.index :dvd_id
      t.index :user_id
    end
  end
end
