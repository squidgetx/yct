class AddPhotosToEvents < ActiveRecord::Migration
  def change
    add_column :events, :photo_id, :integer
  end
end
