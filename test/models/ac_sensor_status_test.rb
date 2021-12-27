require "test_helper"

class AcSensorStatusTest < ActiveSupport::TestCase
  setup do
    @ac_status = build(:ac_sensor_status)
  end

  test "ac status must be valid" do
    assert @ac_status.valid?
  end
end
