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

ActiveRecord::Schema.define(version: 20160215224044) do

  create_table "contest_user_roles", force: :cascade do |t|
    t.integer  "contest_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "role_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "contest_user_roles", ["contest_id"], name: "index_contest_user_roles_on_contest_id", using: :btree
  add_index "contest_user_roles", ["role_id"], name: "index_contest_user_roles_on_role_id", using: :btree
  add_index "contest_user_roles", ["user_id"], name: "index_contest_user_roles_on_user_id", using: :btree

  create_table "contests", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "short_name",  limit: 65535
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string   "ip",           limit: 255,                null: false
    t.string   "path",         limit: 255,                null: false
    t.string   "method",       limit: 255,                null: false
    t.string   "query_string", limit: 255
    t.string   "user_agent",   limit: 255,                null: false
    t.string   "city",         limit: 255
    t.string   "region_code",  limit: 255
    t.string   "region",       limit: 255
    t.string   "zip",          limit: 255
    t.string   "country",      limit: 255
    t.string   "country_code", limit: 255
    t.decimal  "lat",                      precision: 10
    t.decimal  "lon",                      precision: 10
    t.string   "isp",          limit: 255
    t.string   "organization", limit: 255
    t.string   "reverse",      limit: 255
    t.string   "timezone",     limit: 255
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "requests", ["user_id"], name: "index_requests_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "screen_name",     limit: 255
    t.string   "email",           limit: 255
    t.string   "password",        limit: 255
    t.text     "short_bio",       limit: 65535
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.boolean  "is_admin",                      default: false,                     null: false
    t.string   "profile_picture", limit: 255,   default: "default_profile_picture", null: false
  end

  add_foreign_key "contest_user_roles", "contests", on_update: :cascade, on_delete: :cascade
  add_foreign_key "contest_user_roles", "roles", on_update: :cascade, on_delete: :cascade
  add_foreign_key "contest_user_roles", "users", on_update: :cascade, on_delete: :cascade
  add_foreign_key "requests", "users", on_update: :cascade, on_delete: :cascade
end
