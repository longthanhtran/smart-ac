require "test_helper"

class AcTest < ActiveSupport::TestCase
  setup do
    @valid_ac = build(:ac).serializable_hash
    @invalid_ac = build(:ac, serial_number: nil).serializable_hash
  end

  test "a valid ac can be saved" do
    ac = Ac.new(@valid_ac)
    assert ac.valid?
    assert_not_nil ac.save
  end

  test "invalid ac without serial number does not get saved" do
    invalid_ac = Ac.new(@invalid_ac)
    assert_not invalid_ac.valid?
    assert_not_empty invalid_ac.errors[:serial_number]
  end
end
