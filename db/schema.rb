# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_18_162202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flights", force: :cascade do |t|
    t.date "date"
    t.string "aircraft_type"
    t.string "aircraft_registration"
    t.string "pic_name"
    t.string "copi_name"
    t.string "engine_type"
    t.float "day_time"
    t.float "night_time"
    t.integer "takeoffs_landings"
    t.boolean "cross_country"
    t.string "command_type"
    t.string "from"
    t.string "to"
    t.float "actual_imc"
    t.float "hood"
    t.float "simulator_time"
    t.integer "ifr_appr"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remarks"
    t.index ["user_id"], name: "index_flights_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "radio_certificate"
    t.string "aviation_document"
    t.date "aviation_document_date"
    t.integer "pilot_license_number"
    t.string "pilot_license_type"
    t.date "medical_date"
    t.integer "medical_category"
    t.date "instrument_rating_date"
    t.date "instrument_rating_renewal_date"
    t.date "night_rating_date"
    t.date "FAA_PPL_Conversion_date"
    t.integer "FAA_PPL_license"
    t.integer "FAA_CPL_license"
    t.date "FAA_CPL_conversion_date"
    t.date "biennial_flight_review"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
