class CreateGearTypes < ActiveRecord::Migration
  def change
    create_table :gear_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
