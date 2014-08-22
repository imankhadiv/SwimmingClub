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

ActiveRecord::Schema.define(version: 20140822110158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "postcode"
    t.string   "telephone"
    t.string   "emergency_contact"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.date     "date"
    t.time     "start"
    t.string   "title"
    t.text     "details"
    t.integer  "user_id"
    t.boolean  "notification"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "finish"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "medical_conditions", force: true do |t|
    t.text     "medical_history", default: "", null: false
    t.string   "allergies",       default: "", null: false
    t.text     "medication",      default: "", null: false
    t.string   "doctor",          default: "", null: false
    t.string   "disability",      default: "", null: false
    t.integer  "swimmer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medical_conditions", ["swimmer_id"], name: "index_medical_conditions_on_swimmer_id", using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "parents", force: true do |t|
    t.string   "relation"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parents", ["user_id"], name: "index_parents_on_user_id", using: :btree

  create_table "parents_swimmers", id: false, force: true do |t|
    t.integer "swimmer_id"
    t.integer "parent_id"
  end

  create_table "payments", force: true do |t|
    t.integer  "swimmer_id"
    t.text     "details"
    t.decimal  "amount",     precision: 8, scale: 2
    t.boolean  "paid",                               default: false
    t.date     "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "paid_date"
  end

  add_index "payments", ["swimmer_id"], name: "index_payments_on_swimmer_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "simple_captcha_data", force: true do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key", using: :btree

  create_table "swimmer_times", force: true do |t|
    t.integer  "swimmer_id"
    t.string   "stroke"
    t.integer  "distance"
    t.integer  "times"
    t.string   "meet"
    t.string   "venue"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "age"
    t.string   "course"
    t.string   "level"
  end

  add_index "swimmer_times", ["swimmer_id"], name: "index_swimmer_times_on_swimmer_id", using: :btree

  create_table "swimmers", force: true do |t|
    t.string   "asa_number"
    t.string   "asa_category"
    t.string   "ethnic"
    t.date     "date_of_birth"
    t.string   "sex"
    t.string   "photo_consent"
    t.string   "current_squad"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "email_parent",  default: false
  end

  add_index "swimmers", ["user_id"], name: "index_swimmers_on_user_id", using: :btree

  create_table "swimming_records", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "stroke"
    t.integer  "distance"
    t.string   "level"
    t.string   "meet"
    t.string   "venue"
    t.integer  "time"
    t.integer  "age"
    t.date     "date"
    t.string   "region"
    t.string   "region_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "information"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",           null: false
    t.string   "encrypted_password",     default: "",           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "approved",               default: false
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "dbs_check"
    t.date     "dbs_expiry_date",        default: '2014-08-22'
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
