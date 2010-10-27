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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101027162654) do

  create_table "booths", :force => true do |t|
    t.string   "booth_number"
    t.integer  "color_id"
    t.boolean  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  add_index "booths", ["color_id"], :name => "index_booths_on_color_id"

  create_table "colors", :force => true do |t|
    t.string   "name"
    t.string   "hex_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.text     "profile"
    t.integer  "exhibitor_type_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["exhibitor_type_id"], :name => "index_companies_on_exhibitor_type_id"
  add_index "companies", ["user_id"], :name => "index_companies_on_user_id"

  create_table "exhibitor_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", :force => true do |t|
    t.integer  "company_id"
    t.integer  "booth_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reservations", ["booth_id"], :name => "index_reservations_on_booth_id"
  add_index "reservations", ["company_id"], :name => "index_reservations_on_company_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
