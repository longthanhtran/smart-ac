require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "should get create" do
    get sign_in_url
    assert_response :success
  end

  test "should get destroy" do
    Current.stub_any_instance(:user, @user) do
      delete logout_url
      assert_redirected_to root_url
    end
  end

  test "should get new" do
    get sign_in_url
    assert_response :success
  end
end
