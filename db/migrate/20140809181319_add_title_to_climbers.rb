class AddTitleToClimbers < ActiveRecord::Migration
  def change
    add_column :climbers, :title, :string
  end
end
