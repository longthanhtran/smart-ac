require "test_helper"

class LoginTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "visit login page" do
    get sign_in_url
    assert_response :success
  end

  test "success login with valid user account" do
    post sign_in_url, params: { email: @user.email, password: @user.password }
    assert_redirected_to root_url
  end

  test "redirected to sign_in upon submitting wrong credentials" do
    post sign_in_url, params: { email: @user.email, password: 'wrongpass' }
    assert_response :success
  end

  test "success logout after login" do
    post sign_in_url, params: { email: @user.email, password: @user.password }
    assert_redirected_to root_url

    delete logout_url
    assert_redirected_to root_url
    assert_equal 'Logged out', flash[:notice]
  end
end
