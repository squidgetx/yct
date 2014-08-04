class Post < ActiveRecord::Base
  belongs_to :climber
  has_and_belongs_to_many :photos
  def cover_image
    self.photos.covers.first
  end
end
