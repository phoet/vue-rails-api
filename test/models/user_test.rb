require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "simple roles" do
    admin = users(:admin)
    assert admin.admin?
  end
end
