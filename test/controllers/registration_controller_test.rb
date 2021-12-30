require "test_helper"

class RegistrationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end

  test "should get new" do
    Current.stub_any_instance(:user, @user) do
      get sign_up_url
      assert_response :success
    end
  end

  test "should get create" do
    Current.stub_any_instance(:user, @user) do
      get sign_up_url
      assert_response :success
    end
  end
end
