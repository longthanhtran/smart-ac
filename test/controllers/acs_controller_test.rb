require "test_helper"

class AcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ac = acs(:one)
    @user = create(:user)
  end

  test "should get index" do
    Current.stub_any_instance(:user, @user) do
      get acs_url
      assert_response :success
    end
  end

  test "should get new" do
    Current.stub_any_instance(:user, @user) do
      get new_ac_url
      assert_response :success
    end
  end

  test "should create ac" do
    Current.stub_any_instance(:user, @user) do
      assert_difference("Ac.count") do
        post acs_url, params: { ac: { firmware_version: @ac.firmware_version, registration_date: @ac.registration_date, serial_number: Faker::Code::nric } }
      end

      assert_redirected_to ac_url(Ac.last)
    end
  end

  test "should show ac" do
    Current.stub_any_instance(:user, @user) do
      get ac_url(@ac)
      assert_response :success
    end
  end

  test "should get edit" do
    Current.stub_any_instance(:user, @user) do
      get edit_ac_url(@ac)
      assert_response :success
    end
  end

  test "should update ac" do
    Current.stub_any_instance(:user, @user) do
      patch ac_url(@ac), params: { ac: { firmware_version: Faker::Code.sin, registration_date: @ac.registration_date, serial_number: @ac.serial_number } }
      assert_redirected_to ac_url(@ac)
    end
  end

  test "should destroy ac" do
    Current.stub_any_instance(:user, @user) do
      assert_difference("Ac.count", -1) do
        delete ac_url(@ac)
      end

      assert_redirected_to acs_url
    end
  end
end
