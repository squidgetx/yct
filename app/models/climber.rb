class Climber < ActiveRecord::Base
  has_many :posts
  has_and_belongs_to_many :photos
  has_and_belongs_to_many :events
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "128x128>" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :role, :name, :login, :email, presence: true

  def signedup?(event)
    !self.events.where('event_id = ?', event.id).empty?
  end

  def self.guest
    # return a dummy climber
    return Climber.new(
      name: 'Guest'
    )
  end

  def first_name
    self.name.split(' ').first
  end
end
