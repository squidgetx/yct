class Event < ActiveRecord::Base
  has_and_belongs_to_many :climbers
  has_many :photos

  accepts_nested_attributes_for :photos, reject_if: :all_blank, allow_destroy: true

  has_attached_file :cover, styles: {splash: '960x960', thumb: '256x256'}, default_url: ActionController::Base.helpers.asset_path('missing_event.jpg')


  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
  validates :name, :start_date, :end_date, presence: true

  def nonmembers
    return [] if self.emails.blank?
    return self.emails.split(',').count
  end

  def num_signed_up
    self.climbers.count + self.nonmembers.count
  end


  def self.view user
    if user.nil? || user.id.nil?
      Event.where('private = false')
    else
      Event.all
    end
  end

  def add_email email
    if self.emails.blank?
      self.emails = email
    else
      self.emails = self.emails + "," + email.to_s
    end
    return self.save
  end

  def get_range
    # Return human readable string of the event time
    start_date = self.start_date.to_date.to_s(:short)
    end_date = self.end_date.to_date.to_s(:short)
    start_time = Time.at(self.start_date).strftime('%R')
    end_time = Time.at(self.end_date).strftime('%R')
    if start_date == end_date
      # the event is a single day event
      return "#{start_date} #{start_time} - #{end_time}" if start_time != end_time
      return "#{start_date}"
    else
      # the event spans multiple days
      return "#{start_date} - #{end_date}"
    end
  end
end
