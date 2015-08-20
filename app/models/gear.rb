class Gear < ActiveRecord::Base
  belongs_to :gear_type
  belongs_to :climber

  validates :climber, :gear_type_id, :quantity, presence: true
  validats :quantity, numericality: { only_integer: true }
end
