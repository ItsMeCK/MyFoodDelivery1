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

ActiveRecord::Schema.define(version: 20170928151643) do

  create_table "addresses", force: :cascade do |t|
    t.string   "building_name"
    t.string   "address1"
    t.string   "address2"
    t.integer  "pincode"
    t.integer  "locality_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "delivery_boys", force: :cascade do |t|
    t.string   "name"
    t.string   "mobile"
    t.integer  "locality_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "food_items", force: :cascade do |t|
    t.string   "name"
    t.string   "item_image"
    t.string   "food_type"
    t.integer  "locality_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "price"
  end

  create_table "localities", force: :cascade do |t|
    t.string   "locality_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "food_item_id"
    t.decimal  "total"
    t.integer  "quantity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "address_id"
    t.integer  "time_slot_id"
    t.integer  "delivery_boy_id"
    t.string   "status"
    t.integer  "payment_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.decimal  "total"
  end

  create_table "time_slots", force: :cascade do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name"
    t.integer  "mobile"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
