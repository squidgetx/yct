class CreatePendingClimbers < ActiveRecord::Migration
  def change
    create_table :pending_climbers do |t|
      t.text :email
      t.text :token
      t.timestamps
    end
  end
end
