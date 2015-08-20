class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.integer :gear_type_id
      t.integer :climber_id
      t.integer :quantity
      t.string :description

      t.timestamps
    end
  end
end
