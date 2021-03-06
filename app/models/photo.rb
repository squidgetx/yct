class Photo < ActiveRecord::Base
  has_and_belongs_to_many :climbers
  belongs_to :event
  has_attached_file :image, styles: { medium: "512x512" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  scope :covers, lambda { where('cover = true') }
end
