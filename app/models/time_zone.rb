class TimeZone < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :key

  scope :by_name, -> (name) { where('lower(name) LIKE lower(?)', "%#{name}%") }

  def time_with_zone
    ActiveSupport::TimeZone.new(key)
  end

  def current_time
    time_with_zone.now
  end

  def utc_offset
    time_with_zone.utc_offset
  end

  def as_json(options = {})
    super(options.merge(methods: [:current_time, :utc_offset]))
  end
end
