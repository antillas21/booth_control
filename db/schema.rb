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

ActiveRecord::Schema.define(:version => 20101102165950) do

  create_table "booths", :force => true do |t|
    t.string   "booth_number"
    t.integer  "color_id"
    t.boolean  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  add_index "booths", ["booth_number"], :name => "index_booths_on_booth_number"
  add_index "booths", ["code"], :name => "index_booths_on_code"
  add_index "booths", ["color_id"], :name => "index_booths_on_color_id"

  create_table "colors", :force => true do |t|
    t.string   "name"
    t.string   "hex_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "colors", ["hex_value"], :name => "index_colors_on_hex_value"
  add_index "colors", ["name"], :name => "index_colors_on_name"

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

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["company_id"], :name => "index_contacts_on_company_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exhibitor_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exhibitor_types", ["name"], :name => "index_exhibitor_types_on_name"

  create_table "maps", :force => true do |t|
    t.string   "map_file"
    t.string   "zoom"
    t.string   "zoom_x"
    t.string   "zoom_y"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offices", :force => true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.integer  "country_id"
    t.string   "rfc"
    t.string   "phone"
    t.string   "fax"
    t.string   "website"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "taxname"
  end

  add_index "offices", ["company_id"], :name => "index_offices_on_company_id"
  add_index "offices", ["country_id"], :name => "index_offices_on_country_id"
  add_index "offices", ["rfc"], :name => "index_offices_on_rfc"
  add_index "offices", ["state_id"], :name => "index_offices_on_state_id"

  create_table "reservations", :force => true do |t|
    t.integer  "company_id"
    t.integer  "booth_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reservations", ["booth_id"], :name => "index_reservations_on_booth_id"
  add_index "reservations", ["company_id"], :name => "index_reservations_on_company_id"

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "",    :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                       :default => "",    :null => false
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
    t.boolean  "admin",                               :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
