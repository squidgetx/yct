class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :signup
      t.timestamps
    end
  end
end
