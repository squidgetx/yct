class Loan < ActiveRecord::Base
  belongs_to :climber

  validates :climber, :gear, :quantity, presence: true
end
