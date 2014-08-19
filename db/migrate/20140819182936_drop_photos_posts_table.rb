class DropPhotosPostsTable < ActiveRecord::Migration
  def down
    create_table :photos_posts do |t|
      t.integer :photo_id
      t.integer :post_id
    end
  end

  def up
    drop_table :photos_posts
  end

end
