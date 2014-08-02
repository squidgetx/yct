class Post < ActiveRecord::Base
  belongs_to :climber
  has_and_belongs_to_many :photos
end
