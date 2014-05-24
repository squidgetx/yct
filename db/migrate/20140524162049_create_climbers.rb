class CreateClimbers < ActiveRecord::Migration
  def change
    create_table :climbers do |t|
      t.string :name
      t.string :college
      t.string :year
      t.text :description

      t.timestamps
    end
  end
end
