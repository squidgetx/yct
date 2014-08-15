class Event < ActiveRecord::Base

  has_attached_file :cover, styles: {splash: '960x960', thumb: '256x256'}, default_url: "images/:style/missing.png"

  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
  validates :name, :start_date, :end_date, presence: true

  def get_range
    # Return human readable string of the event time
    start_date = self.start_date.to_date.to_s(:short)
    end_date = self.end_date.to_date.to_s(:short)
    start_time = Time.at(self.start_date).strftime('%R')
    end_time = Time.at(self.end_date).strftime('%R')
    if start_date == end_date
      # the event is a single day event
      return "#{start_date} #{start_time} - #{end_time}"
    else
      # the event spans multiple days
      return "#{start_date} #{start_time} - #{end_date} #{end_time}"
    end
  end
end
