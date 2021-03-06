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

ActiveRecord::Schema.define(version: 20160722172104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string   "loan_title"
    t.text     "loan_detail"
    t.string   "loan_destination"
    t.string   "funding_days"
    t.boolean  "has_credit_card",  default: false
    t.boolean  "has_insurance",    default: false
    t.boolean  "has_car",          default: false
    t.string   "other_income"
    t.string   "education"
    t.string   "pay_job"
    t.string   "year_job"
    t.string   "company_job"
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "applications", ["user_id"], name: "index_applications_on_user_id", using: :btree

  create_table "expenses", force: :cascade do |t|
    t.string   "expense_type"
    t.float    "amount"
    t.integer  "application_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "expenses", ["application_id"], name: "index_expenses_on_application_id", using: :btree

  create_table "references", force: :cascade do |t|
    t.string   "first_name"
    t.string   "second_name"
    t.string   "f_last_name"
    t.string   "s_last_name"
    t.string   "mobile"
    t.string   "relation_type"
    t.integer  "application_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "references", ["application_id"], name: "index_references_on_application_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",                           default: "email", null: false
    t.string   "uid",                                default: "",      null: false
    t.string   "encrypted_password",                 default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",                      default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "first_name",             limit: 100
    t.string   "second_name",            limit: 100
    t.string   "f_last_name",            limit: 100
    t.string   "s_last_name",            limit: 100
    t.string   "sex",                    limit: 10
    t.datetime "birth_day"
    t.string   "curp",                   limit: 18
    t.string   "rfc",                    limit: 13
    t.string   "mobile",                 limit: 20
    t.string   "phone",                  limit: 20
    t.boolean  "finished",                           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
