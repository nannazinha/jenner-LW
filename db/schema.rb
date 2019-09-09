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

ActiveRecord::Schema.define(version: 2019_09_09_001442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "date"
    t.string "status"
    t.integer "price"
    t.bigint "laboratory_id"
    t.bigint "vaccine_id"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratory_id"], name: "index_appointments_on_laboratory_id"
    t.index ["member_id"], name: "index_appointments_on_member_id"
    t.index ["vaccine_id"], name: "index_appointments_on_vaccine_id"
  end

  create_table "laboratories", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "website"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "opening_time"
    t.integer "closing_time"
  end

  create_table "laboratory_vaccines", force: :cascade do |t|
    t.bigint "laboratory_id"
    t.bigint "vaccine_id"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratory_id"], name: "index_laboratory_vaccines_on_laboratory_id"
    t.index ["vaccine_id"], name: "index_laboratory_vaccines_on_vaccine_id"
  end

  create_table "member_vaccines", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "vaccine_id"
    t.date "vaccine_date"
    t.boolean "vaccinated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_member_vaccines_on_member_id"
    t.index ["vaccine_id"], name: "index_member_vaccines_on_vaccine_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "category"
    t.bigint "user_id"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "vaccine_sku"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.jsonb "payment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vaccines", force: :cascade do |t|
    t.string "name"
    t.integer "vaccination_age"
    t.integer "doses"
    t.boolean "lab"
    t.boolean "sus"
    t.boolean "required"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
  end

  add_foreign_key "appointments", "laboratories"
  add_foreign_key "appointments", "members"
  add_foreign_key "appointments", "vaccines"
  add_foreign_key "laboratory_vaccines", "laboratories"
  add_foreign_key "laboratory_vaccines", "vaccines"
  add_foreign_key "member_vaccines", "members"
  add_foreign_key "member_vaccines", "vaccines"
  add_foreign_key "members", "users"
  add_foreign_key "orders", "users"
end
