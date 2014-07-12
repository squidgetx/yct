class AddLoginToClimbers < ActiveRecord::Migration
  def change
    add_column :climbers, :login, :string
  end
end
