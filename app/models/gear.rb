class Gear < ActiveRecord::Base
  belongs_to :gear_type
  belongs_to :climber

  validates :climber, :gear_type, :quantity, presence: true
end
