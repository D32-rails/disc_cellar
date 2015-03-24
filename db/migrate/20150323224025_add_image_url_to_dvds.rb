class AddImageUrlToDvds < ActiveRecord::Migration
  def change
    add_column :dvds, :image_url, :string
  end
end
