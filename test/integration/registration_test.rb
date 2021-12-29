require "test_helper"

class RegistrationTest < ActionDispatch::IntegrationTest

  setup do
    @user = build(:new_user)
    @known_user = create(:long)
  end

  test "has a form to invite new user with email" do
    Current.stub_any_instance(:user, @user) do
      get sign_up_url
      assert_response :success
    end
  end

  test "creates a user account for new user with provided email" do
    Current.stub_any_instance(:user, @user) do
      post sign_up_url, params: { user: { email: @user.email } }
      assert_redirected_to root_url
    end
  end

  test "render registration form when entering existing user email" do
    Current.stub_any_instance(:user, @user) do
      post sign_up_url, params: { user: { email: @known_user.email } }
      assert_response :success
    end
  end

end
