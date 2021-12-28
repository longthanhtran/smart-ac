require "test_helper"

class RegistrationTest < ActionDispatch::IntegrationTest

  setup do
    @user = build(:new_user)
    @known_user = create(:long)
  end

  test "has a form to invite new user with email" do
    get sign_up_url
    assert_response :success
  end

  test "creates a user account for new user with provided email" do
    post sign_up_url, params: { user: { email: @user.email } }
    assert_redirected_to root_url
  end

  test "render registration form when entering existing user email" do
    post sign_up_url, params: { user: { email: @known_user.email } }
    assert_response :success
  end

end
