require "test_helper"

class ApiAcsTest < ActionDispatch::IntegrationTest
  setup do
    @ac = create(:ac)
    @new_ac = build(:random_ac)
    @invalid_ac = build(:ac, serial_number: nil)
  end

  test "get all acs" do
    get api_acs_url
    assert_response :success
  end

  test "should show an ac" do
    get api_ac_url(@ac.serial_number)
    assert_response :success
    assert_equal @ac.serial_number, JSON.parse(@response.body)["serial_number"]
  end

  test "should register new valid ac" do
    post api_acs_url, params: { ac: @new_ac.serializable_hash }
    assert_response :created
  end

  test "should not register new invalid ac" do
    post api_acs_url, params: { ac: @invalid_ac.serializable_hash }
    assert_response :unprocessable_entity
  end

  test "should not register duplicate serial_number ac" do
    ac = @new_ac.serializable_hash
    2.times do
      post api_acs_url, params: { ac: ac }
    end
    assert_response :unprocessable_entity
  end
end
