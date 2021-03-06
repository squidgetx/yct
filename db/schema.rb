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

ActiveRecord::Schema.define(version: 20150820172225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_configs", force: true do |t|
    t.string  "title"
    t.text    "about"
    t.string  "member_name"
    t.boolean "restrict_new_accounts"
    t.string  "events_header"
    t.string  "posts_header"
    t.string  "climbers_header"
  end

  create_table "climbers", force: true do |t|
    t.string   "name"
    t.string   "college"
    t.string   "year"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "login"
    t.string   "role"
    t.string   "email"
    t.string   "title"
  end

  create_table "climbers_events", force: true do |t|
    t.integer "climber_id"
    t.integer "event_id"
  end

  create_table "climbers_photos", force: true do |t|
    t.integer "climber_id"
    t.integer "photo_id"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "signup"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.boolean  "public_signup"
    t.boolean  "private",            default: false
    t.text     "emails"
  end

  create_table "faqs", force: true do |t|
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gear_types", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gears", force: true do |t|
    t.integer  "gear_type_id"
    t.integer  "climber_id"
    t.integer  "quantity"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "loans", force: true do |t|
    t.integer  "gear_id"
    t.integer  "climber_id"
    t.integer  "quantity"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pending_climbers", force: true do |t|
    t.text     "email"
    t.text     "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  create_table "photos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "cover"
    t.integer  "event_id"
  end

  create_table "post_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.integer  "climber_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "private",    default: false
  end

end
