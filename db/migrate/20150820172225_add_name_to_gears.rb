class AddNameToGears < ActiveRecord::Migration
  def change
    add_column :gears, :name, :string
  end
end
