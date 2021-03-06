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

ActiveRecord::Schema.define(version: 20150324225438) do

  create_table "borrowships", force: :cascade do |t|
    t.integer  "dvd_id"
    t.integer  "borrower_id"
    t.integer  "lender_id"
    t.boolean  "accepted"
    t.boolean  "returned"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dvds", force: :cascade do |t|
    t.string   "genre"
    t.integer  "year"
    t.string   "rated"
    t.boolean  "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.string   "image_url"
  end

  create_table "dvds_users", id: false, force: :cascade do |t|
    t.integer "dvd_id",  null: false
    t.integer "user_id", null: false
  end

  add_index "dvds_users", ["dvd_id"], name: "index_dvds_users_on_dvd_id"
  add_index "dvds_users", ["user_id"], name: "index_dvds_users_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "address"
    t.integer  "role"
    t.string   "email"
    t.string   "image"
  end

end
