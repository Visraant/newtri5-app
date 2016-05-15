# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160515152007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emts", force: :cascade do |t|
    t.string   "emt_name"
    t.string   "emt_phone_number"
    t.string   "patient_name"
    t.string   "patient_gender"
    t.string   "patient_age"
    t.string   "patient_symptoms"
    t.string   "patient_condition"
    t.string   "patient_address"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "capacity"
    t.integer  "trauma_level"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "patient_score"
  end

  add_index "hospitals", ["email"], name: "index_hospitals_on_email", unique: true, using: :btree
  add_index "hospitals", ["reset_password_token"], name: "index_hospitals_on_reset_password_token", unique: true, using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "gender"
    t.string   "birthdate"
    t.string   "reason_for_visit"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "hospital_id"
    t.integer  "patient_score"
  end

end
