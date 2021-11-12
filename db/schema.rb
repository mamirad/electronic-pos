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

ActiveRecord::Schema.define(version: 2021_11_12_114732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email_address"
    t.string "phone_number"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.boolean "published", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "store_configuration_id"
    t.string "father_or_spouse"
    t.integer "salary_or_income"
    t.string "job_or_work_address"
    t.string "cnic_no"
    t.string "job_duration"
    t.string "present_address"
    t.integer "house_ownership", default: 0
    t.string "permanent_address"
    t.string "cast"
    t.string "check_no"
    t.string "dob"
    t.string "bank"
    t.string "profession_or_rank"
    t.integer "check_ownership", default: 0
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "price"
    t.integer "expense_type"
    t.string "remarks"
    t.bigint "store_configuration_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_configuration_id"], name: "index_expenses_on_store_configuration_id"
  end

  create_table "item_categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_stocks", force: :cascade do |t|
    t.bigint "item_id"
    t.integer "quantity"
    t.string "remarks"
    t.integer "store_configuration_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "old_quantity"
    t.index ["item_id"], name: "index_item_stocks_on_item_id"
  end

  create_table "items", id: :serial, force: :cascade do |t|
    t.string "sku"
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 8, scale: 2
    t.integer "stock_amount"
    t.integer "amount_sold", default: 0
    t.decimal "cost_price", precision: 8, scale: 2
    t.boolean "published", default: true
    t.integer "stock_in_handss"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "item_category_id"
    t.string "supplier"
    t.date "manufacture_at"
    t.date "expire_at"
    t.integer "min_items"
    t.integer "item_unit"
    t.integer "status"
    t.string "document"
    t.integer "lot"
    t.string "brand"
    t.integer "supplier_id"
    t.string "item_img"
    t.integer "discount"
    t.integer "store_configuration_id"
    t.boolean "is_online", default: true
  end

  create_table "items_returns", force: :cascade do |t|
    t.integer "quantity"
    t.date "return_at"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_items_returns_on_item_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "name"
    t.string "organization"
    t.string "email"
    t.string "phone"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", id: :serial, force: :cascade do |t|
    t.integer "item_id"
    t.integer "quantity", default: 1
    t.decimal "price", precision: 8, scale: 2
    t.decimal "total_price", precision: 8, scale: 2
    t.integer "sale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "profit"
  end

  create_table "logs", force: :cascade do |t|
    t.string "log_detail"
    t.string "logable_type"
    t.bigint "logable_id"
    t.integer "store_configuration_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["logable_type", "logable_id"], name: "index_logs_on_logable_type_and_logable_id"
  end

  create_table "payments", id: :serial, force: :cascade do |t|
    t.integer "sale_id"
    t.decimal "amount", precision: 8, scale: 2
    t.string "payment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "remaining_amount"
    t.string "detail"
  end

  create_table "sales", id: :serial, force: :cascade do |t|
    t.decimal "amount", precision: 8, scale: 2
    t.decimal "total_amount", precision: 8, scale: 2
    t.decimal "remaining_amount"
    t.decimal "discount", precision: 8, scale: 2
    t.decimal "tax", precision: 8, scale: 2
    t.integer "customer_id"
    t.text "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "sale_type", default: 0, null: false
    t.integer "sale_status", default: 0, null: false
    t.integer "store_configuration_id"
  end

  create_table "store_configurations", id: :serial, force: :cascade do |t|
    t.string "store_name"
    t.text "store_description"
    t.string "email_address"
    t.string "phone_number"
    t.string "website_url"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "currency"
    t.decimal "tax_rate", precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "balance", default: 0
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "can_update_users", default: false
    t.boolean "can_update_items", default: true
    t.boolean "can_update_configuration", default: false
    t.boolean "can_view_reports", default: false
    t.boolean "can_update_sale_discount", default: false
    t.boolean "can_remove_sales", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "store_configuration_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "expenses", "store_configurations"
  add_foreign_key "item_stocks", "items"
  add_foreign_key "items_returns", "items"
end
