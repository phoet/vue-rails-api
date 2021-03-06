require 'test_helper'

class TimeZoneTest < ActiveSupport::TestCase
  fixtures :users, :time_zones

  test "times in zones" do
    travel_to(Time.new(2017, 8, 27, 12)) do
      {
        'Europe/London' => '2017-08-27 11:00:00 +0100',
        'Europe/Berlin' => '2017-08-27 12:00:00 +0200',
      }.each do |(key, date)|
        tz = TimeZone.new(key: key)
        assert_equal date, tz.current_time.to_s
      end
    end
  end

  test "finding by name" do
    london_tz = time_zones(:london)
    tz = TimeZone.by_name('Whooot').first

    assert_equal london_tz, tz
  end
end
