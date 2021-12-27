require "test_helper"

class AcStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ac = create(:ac)
    @ac_status = build(:ac_sensor_status, serial_number: @ac.serial_number).serializable_hash
    @invalid_ac_status = build(:ac_sensor_status, serial_number: nil).serializable_hash
    @arr_ac_status = build_list(:ac_sensor_status, 3)
    @large_ac_statuses = build_list(:ac_sensor_status, 501)
    @mixed_ac_statuses = @arr_ac_status.dup << build(:ac_sensor_status, serial_number: nil)
  end

  test "receive forbidden if post without a valid token" do
    post api_ac_statuses_url, headers: {"X-Serial" => "non-sense-token"}
    assert_response :forbidden
  end

  test "receive forbidden if post without X-Serial token" do
    post api_ac_statuses_url
    assert_response :forbidden
  end

  test "create ac sensor status with proper data" do
    assert_difference "AcSensorStatus.count" do
      post api_ac_statuses_url,
        headers: {"X-Serial": @ac.serial_number},
        params: { ac_status: @ac_status }, as: :json
    end
    assert_response :accepted
  end

  test "can not create ac sensor status without serial number" do
    post api_ac_statuses_url,
      headers: {"X-Serial": @ac.serial_number},
      params: { ac_status: @invalid_ac_status }, as: :json

    assert_response :unprocessable_entity
  end

  test "batch insert of ac status get saved" do
    assert_difference "AcSensorStatus.count", 3 do
      post api_ac_statuses_url,
        headers: {"X-Serial": @ac.serial_number},
        params: { ac_status: @arr_ac_status.map {|status| status.serializable_hash} }, as: :json
    end
    assert_response :accepted
  end

  test "batch insert of more than 500 status is failed" do
    post api_ac_statuses_url,
      headers: {"X-Serial": @ac.serial_number},
      params: { ac_status: @large_ac_statuses }, as: :json

    assert_response :unprocessable_entity
  end

  test "mixed ac statuses only get valid ones saved" do
    skip "Unsure how to skip invalid record(s)"
    assert_difference "AcSensorStatus.count", 3 do
      post api_ac_statuses_url,
        headers: {"X-Serial" => @ac.serial_number},
        params: { ac_status: @mixed_ac_statuses.map {|status| status.serializable_hash} }, as: :json
    end
    assert_response :accepted
  end

end
