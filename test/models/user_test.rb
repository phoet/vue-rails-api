require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "simple roles" do
    admin = users(:admin)

    assert admin.admin?
  end

  test "role abilities for user" do
    user = users(:user)

    assert user.can?(:user)
    refute user.can?(:user_manager)
    refute user.can?(:admin)
  end

  test "role abilities for user_manager" do
    user_manager = users(:user_manager)

    assert user_manager.can?(:user)
    assert user_manager.can?(:user_manager)
    refute user_manager.can?(:admin)
  end

  test "role abilities for admin" do
    admin = users(:admin)

    assert admin.can?(:user)
    assert admin.can?(:user_manager)
    assert admin.can?(:admin)
  end
end
