require 'test_helper'

class TimeZoneTest < ActiveSupport::TestCase
  fixtures :users, :time_zones

  test "times in zones" do
    travel_to(Time.new(2017, 8, 27, 12)) do
      {
        'Europe/London' => '2017-08-27 11:00:00 +0100',
        'Europe/Berlin' => '2017-08-27 12:00:00 +0200',
      }.each do |(name, date)|
        tz = TimeZone.new(name: name)
        assert_equal date, tz.current_time.to_s
      end
    end
  end

  test "finding by name" do
    user = users(:admin)
    london_tz = TimeZone.create!(name: 'Europe/London', user: user)
    tz = TimeZone.by_name('london').first

    assert_equal london_tz, tz
  end
end
