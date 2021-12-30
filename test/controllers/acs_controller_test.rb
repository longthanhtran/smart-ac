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

  test "should show ac" do
    Current.stub_any_instance(:user, @user) do
      get ac_url(@ac)
      assert_response :success
    end
  end

  test "should look for an ac by a valid serial number" do
    Current.stub_any_instance(:user, @user) do
      get show_by_sn_url(serial_number: @ac.serial_number)
      assert_response :success
      assert_select "#serial_number", @ac.serial_number
    end
  end

  test "should unable to look for an ac by an invalid serial number" do
    Current.stub_any_instance(:user, @user) do
      serial_number = "invalid_serial"
      get show_by_sn_url(serial_number: serial_number)
      assert_response :success
      assert_equal "Can not find the ac with #{serial_number}", flash[:notice]
    end
  end
end
