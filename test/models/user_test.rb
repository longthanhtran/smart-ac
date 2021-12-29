require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = build(:user)
    @new_user = create(:new_user)
  end

  test "create a user" do
    assert @user.valid?
  end

  test "new user has inactive status" do
    refute @new_user.active
  end
end
