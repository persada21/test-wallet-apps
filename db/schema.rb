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

ActiveRecord::Schema.define(version: 2022_03_26_052536) do

  create_table "accounts", force: :cascade do |t|
    t.string "number"
    t.decimal "balance", precision: 5, scale: 2, default: "0.0", null: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id", unique: true
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name", limit: 50
    t.string "last_name", limit: 50
    t.date "birth_date"
    t.string "gender"
    t.integer "height"
    t.integer "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.boolean "activation", default: true
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "stock_type"
    t.decimal "balance", precision: 5, scale: 2, default: "0.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "top_ups", force: :cascade do |t|
    t.decimal "amount", precision: 5, scale: 2, default: "0.0", null: false
    t.integer "sender_id"
    t.integer "receiver_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receiver_id"], name: "index_top_ups_on_receiver_id"
    t.index ["sender_id"], name: "index_top_ups_on_sender_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "code"
    t.bigint "grant_id"
    t.string "grant_type"
    t.bigint "transactable_id"
    t.string "transactable_type"
    t.string "subject"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["grant_id", "grant_type"], name: "index_transactions_on_grant_id_and_grant_type"
    t.index ["transactable_id", "transactable_type"], name: "index_transactions_on_transactable_id_and_transactable_type"
  end

  create_table "transfers", force: :cascade do |t|
    t.decimal "amount", precision: 5, scale: 2, default: "0.0", null: false
    t.integer "sender_id"
    t.integer "receiver_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receiver_id"], name: "index_transfers_on_receiver_id"
    t.index ["sender_id"], name: "index_transfers_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "phone_number"
    t.date "birth_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "withdraws", force: :cascade do |t|
    t.decimal "amount", precision: 5, scale: 2, default: "0.0", null: false
    t.string "receiver_number"
    t.integer "sender_id"
    t.integer "receiver_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receiver_id"], name: "index_withdraws_on_receiver_id"
    t.index ["sender_id"], name: "index_withdraws_on_sender_id"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "top_ups", "accounts", column: "receiver_id"
  add_foreign_key "top_ups", "stocks", column: "sender_id"
  add_foreign_key "transfers", "accounts", column: "receiver_id"
  add_foreign_key "transfers", "accounts", column: "sender_id"
  add_foreign_key "withdraws", "accounts", column: "sender_id"
  add_foreign_key "withdraws", "stocks", column: "receiver_id"
end
