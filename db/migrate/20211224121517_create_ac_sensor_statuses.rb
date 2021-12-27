class CreateAcSensorStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :ac_sensor_statuses do |t|
      t.string :serial_number, null: false #, foreign_key: true, type: :string
      t.float :temperature
      t.integer :humidity
      t.integer :co_level
      t.string :health_status, size: 149

      t.timestamps
    end

    add_foreign_key :ac_sensor_statuses, :acs, column: 'serial_number', primary_key: 'serial_number'
  end
end
