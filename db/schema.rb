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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130207092121) do

  create_table "accommodations", :force => true do |t|
    t.string   "name"
    t.text     "brief_description"
    t.text     "description"
    t.integer  "province_id"
    t.string   "city"
    t.string   "address"
    t.integer  "postal_code"
    t.boolean  "featured"
    t.boolean  "published"
    t.integer  "category_id"
    t.integer  "landlord_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "accommodations", ["category_id"], :name => "index_accommodations_on_category_id"
  add_index "accommodations", ["landlord_id"], :name => "index_accommodations_on_landlord_id"
  add_index "accommodations", ["province_id"], :name => "index_accommodations_on_province_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["parent_id"], :name => "index_categories_on_parent_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "offers", :force => true do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "description"
    t.float    "price"
    t.integer  "accommodation_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "offers", ["accommodation_id"], :name => "index_offers_on_accommodation_id"

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "image_owner_id"
    t.string   "image_owner_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "photos", ["image_owner_id", "image_owner_type"], :name => "index_photos_on_image_owner_id_and_image_owner_type"

  create_table "provinces", :force => true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "provinces", ["country_id"], :name => "index_provinces_on_country_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "room_types", :force => true do |t|
    t.string   "name"
    t.text     "brief_description"
    t.text     "description"
    t.integer  "accommodation_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "room_types", ["accommodation_id"], :name => "index_room_types_on_accommodation_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "password"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users", ["role_id"], :name => "index_users_on_role_id"

end
