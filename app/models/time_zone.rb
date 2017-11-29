class TimeZone < ApplicationRecord
  belongs_to :user

  scope :by_name, -> (name) { where('lower(name) LIKE lower(?)', "%#{name}%") }

  def current_time
    tz = ActiveSupport::TimeZone.new(name)
    tz.now
  end
end
