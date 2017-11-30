require 'test_helper'

class TimeZonesControllerTest < ActionDispatch::IntegrationTest
  fixtures :users, :time_zones

  setup do
    @time_zone = time_zones(:one)
    @user = users(:one)
    @headers = {}
    login(:admin, @headers)
  end

  test "should get index" do
    get time_zones_url, headers: @headers, as: :json

    assert_response :success
  end

  test "should get index for managed user" do
    get user_time_zones_url(@user), headers: @headers, as: :json

    assert_response :success
  end

  test "should get index with filter" do
    get time_zones_url(name: 'London'), headers: @headers, as: :json

    assert_response :success
    assert_equal 1, JSON.parse(response.body).size
  end

  test "should create time_zone" do
    assert_difference('TimeZone.count') do
      post time_zones_url, params: { time_zone: { description: @time_zone.description, name: @time_zone.name, user_id: @time_zone.user_id } }, headers: @headers, as: :json
    end

    assert_response 201
  end

  test "should show time_zone" do
    get time_zone_url(@time_zone), headers: @headers, as: :json
    assert_response :success
  end

  test "should update time_zone" do
    patch time_zone_url(@time_zone), params: { time_zone: { description: @time_zone.description, name: @time_zone.name, user_id: @time_zone.user_id } }, headers: @headers, as: :json
    assert_response 200
  end

  test "should destroy time_zone" do
    assert_difference('TimeZone.count', -1) do
      delete time_zone_url(@time_zone), headers: @headers, as: :json
    end

    assert_response 204
  end

  private

  def login(who, headers)
    open_session do |sess|
      who = users(who)
      sess.post "/api/authenticate", params: { email: who.email, password: 'xxxxxxxx' }, as: :json
      auth = JSON.parse(sess.response.body)
      headers.merge!('Authorization' => auth['auth_token'])
    end
  end
end
