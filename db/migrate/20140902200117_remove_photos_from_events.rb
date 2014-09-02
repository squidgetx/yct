class RemovePhotosFromEvents < ActiveRecord::Migration
  def self.up
    remove_column :events, :photo_id
  end
  def self.down
    add_column :events, :photo_id, :integer
  end
end
