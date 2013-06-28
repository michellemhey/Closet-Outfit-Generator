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

ActiveRecord::Schema.define(:version => 20130628021157) do

  create_table "clothings", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "type_id"
    t.string   "image_path"
    t.boolean  "is_dirty"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "image"
  end

  create_table "clothings_outfits", :id => false, :force => true do |t|
    t.integer "clothing_id"
    t.integer "outfit_id"
  end

  add_index "clothings_outfits", ["clothing_id", "outfit_id"], :name => "index_clothings_outfits_on_clothing_id_and_outfit_id"
  add_index "clothings_outfits", ["outfit_id"], :name => "index_clothings_outfits_on_outfit_id"

  create_table "clothings_styles", :id => false, :force => true do |t|
    t.integer "clothing_id"
    t.integer "style_id"
  end

  add_index "clothings_styles", ["clothing_id", "style_id"], :name => "index_clothings_styles_on_clothing_id_and_style_id"
  add_index "clothings_styles", ["style_id"], :name => "index_clothings_styles_on_style_id"

  create_table "clothings_temperatures", :id => false, :force => true do |t|
    t.integer "clothing_id"
    t.integer "temperature_id"
  end

  add_index "clothings_temperatures", ["clothing_id", "temperature_id"], :name => "index_clothings_temperatures_on_clothing_id_and_temperature_id"
  add_index "clothings_temperatures", ["temperature_id"], :name => "index_clothings_temperatures_on_temperature_id"

  create_table "images", :force => true do |t|
    t.integer  "image_id"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "outfits", :force => true do |t|
    t.string   "name"
    t.boolean  "is_favorite"
    t.date     "last_worn"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "photos", :force => true do |t|
    t.integer  "property_id"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "styles", :force => true do |t|
    t.string   "label"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "temperatures", :force => true do |t|
    t.string   "label"
    t.integer  "low"
    t.integer  "high"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "type_classes", :force => true do |t|
    t.string   "name"
    t.string   "symbol"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "types", :force => true do |t|
    t.string   "name"
    t.integer  "type_class_id"
    t.string   "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "avatar"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
