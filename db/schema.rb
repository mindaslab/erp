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

ActiveRecord::Schema.define(version: 20141214064620) do

  create_table "books", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency"
  end

  add_index "books", ["company_id"], name: "index_books_on_company_id"

  create_table "collabs", force: true do |t|
    t.string   "email"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collabs", ["company_id"], name: "index_collabs_on_company_id"

  create_table "companies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "companies_users", id: false, force: true do |t|
    t.integer "company_id"
    t.integer "user_id"
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
    t.integer  "sno",                    default: 0
  end

  add_index "contacts", ["company_id"], name: "index_contacts_on_company_id"

  create_table "docs", force: true do |t|
    t.integer  "finance_record_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "docs", ["finance_record_id"], name: "index_docs_on_finance_record_id"

  create_table "finance_records", force: true do |t|
    t.decimal  "amount"
    t.text     "description"
    t.integer  "book_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "time"
    t.integer  "sno",         default: 0
    t.integer  "contact_id"
  end

  add_index "finance_records", ["book_id"], name: "index_finance_records_on_book_id"
  add_index "finance_records", ["contact_id"], name: "index_finance_records_on_contact_id"

  create_table "notes", force: true do |t|
    t.text     "content"
    t.integer  "finance_record_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["finance_record_id"], name: "index_notes_on_finance_record_id"

  create_table "permits", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permits", ["email"], name: "index_permits_on_email"

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

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
