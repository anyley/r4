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

ActiveRecord::Schema.define(version: 20160420104509) do

  create_table "poll_fields", force: :cascade do |t|
    t.integer  "field_id"
    t.string   "field_type"
    t.string   "name"
    t.string   "label"
    t.string   "label_side"
    t.boolean  "label_visible"
    t.decimal  "width"
    t.decimal  "height"
    t.string   "class_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "poll_fields", ["field_type", "field_id"], name: "index_poll_fields_on_field_type_and_field_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "password"
  end

  create_table "widgets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
