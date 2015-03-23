class AddingNameToDvds < ActiveRecord::Migration
  def change
    add_column :dvds, :name, :string
  end
end
