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

ActiveRecord::Schema.define(version: 20161119193356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "pets", force: :cascade do |t|
    t.string   "pet_type"
    t.string   "breed"
    t.string   "name"
    t.string   "sex"
    t.string   "color"
    t.integer  "age"
    t.datetime "date_seen"
    t.string   "note"
    t.string   "images"
    t.boolean  "lost"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_pets_on_user_id", using: :btree
  end

  create_table "sightings", force: :cascade do |t|
    t.string   "pet_type"
    t.datetime "date_seen"
    t.string   "note"
    t.string   "images"
    t.string   "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.index ["user_id"], name: "index_sightings_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "city"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "image"
  end

  add_foreign_key "messages", "users"
  add_foreign_key "pets", "users"
  add_foreign_key "sightings", "users"
end
