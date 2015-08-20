class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :gear_id
      t.integer :climber_id
      t.integer :quantity
      t.string :description

      t.timestamps
    end
  end
end
