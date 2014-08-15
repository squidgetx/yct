class Event < ActiveRecord::Base
  validates :name, :start_date, :end_date, presence: true

  def get_range
    # Return human readable string of the event time
    start_date = self.start_date.to_date(:long)
    end_date = self.end_date.to_date.to_s(:long)
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
