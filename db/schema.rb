# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_06_150928) do

  create_table "categories", charset: "utf8mb3", force: :cascade do |t|
    t.integer "name_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_details", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.integer "amount"
    t.string "note"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_details_on_order_id"
    t.index ["product_id"], name: "index_order_details_on_product_id"
    t.index ["user_id"], name: "index_order_details_on_user_id"
  end

  create_table "orders", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "status"
    t.integer "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.integer "price"
    t.integer "status"
    t.string "image"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "login_id"
    t.string "display_name"
    t.string "password_digest"
    t.string "login_token"
    t.string "access_token"
    t.integer "status"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "order_details", "orders"
  add_foreign_key "order_details", "products"
  add_foreign_key "order_details", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
end
