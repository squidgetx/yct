class AddRoleToPendingClimbers < ActiveRecord::Migration
  def change
    add_column :pending_climbers, :role, :string
  end
end
