class TimeZone < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :description

  scope :by_name, -> (name) { where('lower(name) LIKE lower(?)', "%#{name}%") }

  def current_time
    tz = ActiveSupport::TimeZone.new(name)
    tz.now
  end

  def as_json(options = {})
    super(options.merge(methods: :current_time))
  end
end
