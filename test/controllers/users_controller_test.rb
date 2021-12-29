require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
    @long = create(:long)
  end

  test "should get index" do
    Current.stub_any_instance(:user, @user) do
      get users_url
      assert_response :success
    end
  end


  test "should active a user" do
    Current.stub_any_instance(:user, @user) do
      patch users_url, params: { user: { id: @long.id, active: true } }
      assert_redirected_to users_url
      assert User.find_by(id: @long.id).active
    end
  end

  test "should not deactivate current user" do
    Current.stub_any_instance(:user, @user) do
      patch users_url, params: { user: { id: @user.id, active: false } }
      assert User.find_by(id: @user.id).active
    end
  end

  test "should show a user record" do
    skip "wait for implementation"
    get users_show_url
    assert_response :success
  end
end
