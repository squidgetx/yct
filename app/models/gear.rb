class Gear < ActiveRecord::Base
  belongs_to :gear_type

  validates :climber, :gear_type, :quantity, presence: true
end
