class TimeZone < ApplicationRecord
  belongs_to :user

  def current_time
    tz = ActiveSupport::TimeZone.new(name)
    tz.now
  end
end
