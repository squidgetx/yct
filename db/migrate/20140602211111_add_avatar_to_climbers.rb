class AddAvatarToClimbers < ActiveRecord::Migration
  	def self.up
    add_attachment :climbers, :avatar
  end

end
