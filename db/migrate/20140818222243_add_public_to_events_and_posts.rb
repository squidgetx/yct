class AddPublicToEventsAndPosts < ActiveRecord::Migration
  def change
    add_column :events, :public_signup, :boolean
    add_column :events, :private, :boolean, default: false
    add_column :posts, :private, :boolean, default: false
  end
end
