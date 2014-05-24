class Climber < ActiveRecord::Base
	validates :name, presence: true
	has_many :posts
end
