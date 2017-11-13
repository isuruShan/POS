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

ActiveRecord::Schema.define(version: 20171031155635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pos_inv_destinations", force: :cascade do |t|
    t.string   "name"
    t.integer  "pos_inv_invoice_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["pos_inv_invoice_id"], name: "index_pos_inv_destinations_on_pos_inv_invoice_id", using: :btree
  end

  create_table "pos_inv_extra_charges", force: :cascade do |t|
    t.string   "name"
    t.float    "amount"
    t.integer  "pos_inv_invoice_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["pos_inv_invoice_id"], name: "index_pos_inv_extra_charges_on_pos_inv_invoice_id", using: :btree
  end

  create_table "pos_inv_invoices", force: :cascade do |t|
    t.integer  "invoice_num"
    t.integer  "gatepass_number"
    t.date     "billing_date"
    t.date     "delivery_date"
    t.integer  "rate_of_transporter"
    t.string   "customer"
    t.boolean  "return",              default: false
    t.integer  "pos_usr_lorry_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.float    "amount"
    t.float    "tax"
    t.float    "tax_percentage",      default: 15.0
    t.boolean  "money_recieved"
    t.boolean  "money_transfered"
    t.string   "tax_destination"
    t.integer  "pos_usr_user_id"
    t.index ["pos_usr_lorry_id"], name: "index_pos_inv_invoices_on_pos_usr_lorry_id", using: :btree
    t.index ["pos_usr_user_id"], name: "index_pos_inv_invoices_on_pos_usr_user_id", using: :btree
  end

  create_table "pos_usr_lorries", force: :cascade do |t|
    t.integer  "reg_number"
    t.string   "number"
    t.string   "image"
    t.integer  "pos_usr_transpoter_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "pos_usr_lorry_category_id"
    t.index ["pos_usr_lorry_category_id"], name: "index_pos_usr_lorries_on_pos_usr_lorry_category_id", using: :btree
    t.index ["pos_usr_transpoter_id"], name: "index_pos_usr_lorries_on_pos_usr_transpoter_id", using: :btree
  end

  create_table "pos_usr_lorry_categories", force: :cascade do |t|
    t.string   "category"
    t.float    "city_charge"
    t.float    "milage_charge"
    t.integer  "fridge_capacity"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "pos_usr_lorry_owners", force: :cascade do |t|
    t.string   "name"
    t.integer  "nic"
    t.integer  "account_number"
    t.string   "phone"
    t.string   "image"
    t.integer  "pos_usr_lorry_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["pos_usr_lorry_id"], name: "index_pos_usr_lorry_owners_on_pos_usr_lorry_id", using: :btree
  end

  create_table "pos_usr_transpoters", force: :cascade do |t|
    t.string   "name"
    t.string   "owner_name"
    t.string   "address"
    t.string   "email"
    t.integer  "vat_reg_num"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "pos_usr_user_id"
    t.index ["pos_usr_user_id"], name: "index_pos_usr_transpoters_on_pos_usr_user_id", using: :btree
  end

  create_table "pos_usr_users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "image"
    t.string   "post"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "active",                 default: true
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_pos_usr_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_pos_usr_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_pos_usr_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "pos_inv_destinations", "pos_inv_invoices"
  add_foreign_key "pos_inv_extra_charges", "pos_inv_invoices"
  add_foreign_key "pos_inv_invoices", "pos_usr_lorries"
  add_foreign_key "pos_inv_invoices", "pos_usr_users"
  add_foreign_key "pos_usr_lorries", "pos_usr_transpoters"
  add_foreign_key "pos_usr_lorry_owners", "pos_usr_lorries"
  add_foreign_key "pos_usr_transpoters", "pos_usr_users"
end
