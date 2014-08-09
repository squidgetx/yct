class AddEmailToClimbers < ActiveRecord::Migration
  def change
    add_column :climbers, :email, :string
  end
end
