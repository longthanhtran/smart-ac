require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = build(:user)
  end

  test "create a user" do
    assert @user.valid?
  end
end
