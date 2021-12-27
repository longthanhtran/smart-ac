class AcSensorStatus < ApplicationRecord
  belongs_to :ac, foreign_key: 'serial_number', primary_key: 'serial_number'

  validates :serial_number, presence: true
end
