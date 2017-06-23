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

ActiveRecord::Schema.define(version: 20170621082101) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.string "product_name"
    t.float "product_price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "status"
    t.string "address_recive"
    t.string "phone_recive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.integer "quantity"
    t.float "rate_point"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "viewed"
    t.boolean "status"
  end

  create_table "rates", force: :cascade do |t|
    t.integer "user_id"
    t.float "rate_point"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suggests", force: :cascade do |t|
    t.integer "user_id"
    t.string "product_name"
    t.string "product_description"
    t.float "product_price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "fullname"
    t.string "email"
    t.string "address"
    t.string "avatar"
    t.string "password_digest"
    t.boolean "is_admin", default: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
