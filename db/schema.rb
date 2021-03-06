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

ActiveRecord::Schema.define(version: 20151210094855) do

  create_table "links", force: :cascade do |t|
    t.string   "full_url"
    t.string   "short_url"
    t.boolean  "active",     default: true
    t.boolean  "deleted",    default: false
    t.integer  "count",      default: 0
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "links", ["user_id"], name: "index_links_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                                                                                         null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "link_count",       default: 0
    t.string   "api_key",          default: "QKK8l5u74DYX4BL2Z1fUdf1UmdKsfDQYtbYn5T1vv9e3suaSy1dJsp0wZ2JlWaOr"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "visit_details", force: :cascade do |t|
    t.string   "ip_address"
    t.string   "referer"
    t.string   "browser_details"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "link_id"
  end

  add_index "visit_details", ["link_id"], name: "index_visit_details_on_link_id"

end
