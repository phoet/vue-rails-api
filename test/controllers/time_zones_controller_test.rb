require 'test_helper'

class TimeZonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_zone = time_zones(:one)
  end

  test "should get index" do
    get time_zones_url, as: :json
    assert_response :success
  end

  test "should create time_zone" do
    assert_difference('TimeZone.count') do
      post time_zones_url, params: { time_zone: { description: @time_zone.description, name: @time_zone.name, user_id: @time_zone.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show time_zone" do
    get time_zone_url(@time_zone), as: :json
    assert_response :success
  end

  test "should update time_zone" do
    patch time_zone_url(@time_zone), params: { time_zone: { description: @time_zone.description, name: @time_zone.name, user_id: @time_zone.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy time_zone" do
    assert_difference('TimeZone.count', -1) do
      delete time_zone_url(@time_zone), as: :json
    end

    assert_response 204
  end
end
