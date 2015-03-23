class ChangeDvdNameToTitle < ActiveRecord::Migration
  def up
    rename_column :dvds, :name, :title
  end

  def down

  end
end
