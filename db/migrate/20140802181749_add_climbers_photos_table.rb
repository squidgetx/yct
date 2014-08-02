class AddClimbersPhotosTable < ActiveRecord::Migration
  def up
    create_table :climbers_photos do |t|
      t.integer :climber_id
      t.integer :photo_id
    end
  end

  def down
    drop_table :climbers_photos
  end
end
