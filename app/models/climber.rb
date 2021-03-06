class Climber < ActiveRecord::Base
  has_many :posts
  has_many :gears
  has_many :loans
  has_and_belongs_to_many :photos
  has_and_belongs_to_many :events
  has_attached_file :avatar, styles: { medium: "300x300>"}, default_url: ActionController::Base.helpers.asset_path('missing_climber.jpg')
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
