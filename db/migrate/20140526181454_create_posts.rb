class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :climber_id
      t.string :text

      t.timestamps
    end
  end
end
