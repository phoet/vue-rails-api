require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @headers = {}
    login(:admin, @headers)
  end

  test "should not authorize users" do
    headers = {}
    login(:user, headers)
    get users_url, headers: headers, as: :json

    assert_response :unauthorized
  end

  test "should authorize user_managers" do
    headers = {}
    login(:user_manager, headers)
    get users_url, headers: headers, as: :json

    assert_response :success
  end

  test "should get index" do
    get users_url, headers: @headers, as: :json

    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { name: @user.name, email: "#{rand()}-#{@user.email}", password: 'xxxxxxxx' } }, headers: @headers, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), headers: @headers, as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { name: @user.name } }, headers: @headers, as: :json
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), headers: @headers, as: :json
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
