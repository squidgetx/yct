class AddPhotosPostsTable < ActiveRecord::Migration
  def up
    create_table :photos_posts do |t|
      t.integer :photo_id
      t.integer :post_id
    end
  end

  def down
    drop_table :photos_posts
  end
end
