class AddClimbersEventsTable < ActiveRecord::Migration
  def self.up
    create_table :climbers_events do |t|
      t.integer :climber_id
      t.integer :event_id
    end
  end
end
