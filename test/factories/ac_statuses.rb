FactoryBot.define do
  factory :ac_sensor_status do
    temperature { 17.0 }
    ac
    humidity { 56 }
    co_level { 99 }
    health_status { "healthy" }
  end
end
