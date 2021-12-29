# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_29_015842) do

  create_table "ac_sensor_statuses", force: :cascade do |t|
    t.string "serial_number", null: false
    t.float "temperature"
    t.integer "humidity"
    t.integer "co_level"
    t.string "health_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "acs", force: :cascade do |t|
    t.string "serial_number"
    t.date "registration_date"
    t.string "firmware_version"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["serial_number"], name: "serial_number_idx", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255, null: false
    t.string "password_digest"
    t.string "reset_token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: false
    t.index ["email"], name: "users_email_idx", unique: true
  end

  add_foreign_key "ac_sensor_statuses", "acs", column: "serial_number", primary_key: "serial_number"
end
