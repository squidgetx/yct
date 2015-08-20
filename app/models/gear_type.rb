class GearType < ActiveRecord::Base
  has_many :gears
  validates :name, presence: true
end
