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

ActiveRecord::Schema.define(version: 20170421211648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dialects", force: :cascade do |t|
    t.string   "name"
    t.string   "apiurl"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "idxdialect1", unique: true, using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.text     "content_translated"
    t.integer  "dialect_id"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["dialect_id"], name: "index_messages_on_dialect_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "title"
    t.string   "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.integer  "dialect_id"
    t.boolean  "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dialect_id"], name: "index_users_on_dialect_id", using: :btree
    t.index ["username"], name: "idxuser1", unique: true, using: :btree
  end

  add_foreign_key "messages", "dialects"
  add_foreign_key "messages", "users"
  add_foreign_key "users", "dialects"
end
