class CreateAcs < ActiveRecord::Migration[7.0]
  def change
    create_table :acs do |t|
      t.string :serial_number, unique: true
      t.date :registration_date
      t.string :firmware_version

      t.timestamps
    end
  end
end
