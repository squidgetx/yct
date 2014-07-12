class AddRoleToClimbers < ActiveRecord::Migration
  def change
    add_column :climbers, :role, :string
  end
end
