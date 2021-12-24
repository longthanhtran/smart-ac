require "test_helper"

class AcTest < ActiveSupport::TestCase
  setup do
    @valid_ac = build(:ac).serializable_hash
    @invalid_ac = build(:ac, serial_number: nil)
  end

  test "a valid ac can be saved" do
    ac = Ac.new(@valid_ac)
    assert ac.valid?
    assert_not_nil ac.save
  end

  test "can not save invalid ac" do
  end
end
