# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_24_114210) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "town_id"
    t.string "location"
    t.string "rooms"
    t.string "rent"
    t.text "infor"
    t.string "name"
    t.string "phone"
    t.integer "status"
    t.string "car"
  end

  create_table "customer_bookings", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "rental_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.integer "status"
  end

  create_table "dream_houses", force: :cascade do |t|
    t.string "name"
    t.integer "bedrooms"
    t.integer "price"
    t.integer "units"
    t.integer "contacts"
    t.integer "user_id"
    t.integer "town_id"
    t.integer "estate_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "estates", force: :cascade do |t|
    t.string "name"
    t.integer "town_id"
  end

  create_table "rental_features", force: :cascade do |t|
    t.string "name"
    t.integer "rental_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.string "name"
    t.integer "bedrooms"
    t.integer "price"
    t.integer "units"
    t.integer "contacts"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "town_id"
    t.integer "estate_id"
    t.string "description"
    t.string "wifi"
    t.integer "bathrooms"
    t.integer "parking"
    t.integer "status"
  end

  create_table "rentors", force: :cascade do |t|
    t.integer "user_id"
    t.integer "rental_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
  end

  create_table "town_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "town_id"
  end

  create_table "towns", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.string "email"
    t.string "location"
    t.text "phone_number"
    t.string "country_code"
    t.boolean "verified", default: false
    t.integer "status"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
