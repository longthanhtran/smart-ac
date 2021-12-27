FactoryBot.define do
  factory :ac do
    serial_number { "ABC123" } # Faker::Code.nric }
    registration_date { 1.day.ago }
    firmware_version { Faker::Code.sin }
  end
end
