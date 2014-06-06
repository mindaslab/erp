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

ActiveRecord::Schema.define(version: 20140606053122) do

  create_table "books", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency"
  end

  add_index "books", ["company_id"], name: "index_books_on_company_id"

  create_table "companies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "ph"
    t.string   "email"
    t.text     "address",    limit: 255
    t.string   "city"
    t.string   "zip"
    t.string   "country"
    t.boolean  "business"
    t.boolean  "customer"
    t.boolean  "supplier"
    t.boolean  "employee"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["company_id"], name: "index_contacts_on_company_id"

  create_table "records", force: true do |t|
    t.decimal  "amount"
    t.text     "description"
    t.integer  "book_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "time"
  end

  add_index "records", ["book_id"], name: "index_records_on_book_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
