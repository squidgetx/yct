class Climber < ActiveRecord::Base
  has_many :posts
  has_and_belongs_to_many :photos
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename", :url => "/system/:attachment/:id/:style/:filename"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.guest
    # return a dummy climber

    return Climber.new(
      name: 'Guest'
    )
  end
end
