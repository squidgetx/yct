class AddCoverToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :cover, :boolean
  end
end
