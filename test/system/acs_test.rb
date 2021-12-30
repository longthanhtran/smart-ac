require "application_system_test_case"

class AcsTest < ApplicationSystemTestCase
  setup do
    @ac = acs(:one)
  end

  test "visiting the index" do
    visit acs_url
    assert_selector "h1", text: "Acs"
  end

  test "should create ac" do
    visit acs_url
    click_on "New ac"

    fill_in "Firmware version", with: @ac.firmware_version
    fill_in "Registration date", with: @ac.registration_date
    fill_in "Serial number", with: @ac.serial_number
    click_on "Create Ac"

    assert_text "Ac was successfully created"
    click_on "Back"
  end

  test "should update Ac" do
    visit ac_url(@ac)
    click_on "Edit this ac", match: :first

    fill_in "Firmware version", with: @ac.firmware_version
    fill_in "Registration date", with: @ac.registration_date
    fill_in "Serial number", with: @ac.serial_number
    click_on "Update Ac"

    assert_text "Ac was successfully updated"
    click_on "Back"
  end

  test "should destroy Ac" do
    visit ac_url(@ac)
    click_on "Destroy this ac", match: :first

    assert_text "Ac was successfully destroyed"
  end
end
