class Ac < ApplicationRecord
  validates :serial_number, presence: true
  validates_uniqueness_of :serial_number

  has_many :ac_sensor_statuses, primary_key: 'serial_number', foreign_key: 'serial_number'

  after_initialize :init

  def init
    self.registration_date ||= Date.today
  end
end
