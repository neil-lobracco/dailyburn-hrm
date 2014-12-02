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

ActiveRecord::Schema.define(version: 20141202203813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "readings", force: true do |t|
    t.integer  "session_id"
    t.integer  "bpm"
    t.datetime "start"
    t.datetime "end"
    t.float    "duration"
  end

  add_index "readings", ["session_id"], name: "index_readings_on_session_id", using: :btree

  create_table "sessions", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.float    "duration"
    t.float    "bpm_mean"
    t.float    "bpm_min"
    t.float    "bpm_max"
    t.float    "zone1_time"
    t.float    "zone2_time"
    t.float    "zone3_time"
    t.float    "zone4_time"
  end

  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.text     "username"
    t.text     "gender"
    t.integer  "age"
    t.integer  "zone1_min"
    t.integer  "zone1_max"
    t.integer  "zone2_min"
    t.integer  "zone2_max"
    t.integer  "zone3_min"
    t.integer  "zone3_max"
    t.integer  "zone4_min"
    t.integer  "zone4_max"
  end

end
