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

ActiveRecord::Schema.define(version: 20170806050144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "avatars", force: :cascade do |t|
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["user_id"], name: "index_avatars_on_user_id", using: :btree
  end

  create_table "banks", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "active",     default: true
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "common_chat_messages", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_common_chat_messages_on_user_id", using: :btree
  end

  create_table "devnews", force: :cascade do |t|
    t.string   "name"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "getbalances", force: :cascade do |t|
    t.string   "walletfirm"
    t.string   "status"
    t.string   "wallet"
    t.text     "desc"
    t.float    "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_getbalances_on_user_id", using: :btree
  end

  create_table "getmoneys", force: :cascade do |t|
    t.float    "total"
    t.text     "desc"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "wallet"
    t.string   "walletfirm"
    t.string   "status"
    t.index ["user_id"], name: "index_getmoneys_on_user_id", using: :btree
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "chat_room_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.float    "currency"
    t.float    "total"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.string   "which"
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "payeers", force: :cascade do |t|
    t.string   "currency"
    t.text     "description"
    t.integer  "total"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_payeers_on_user_id", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "chat_room_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["chat_room_id"], name: "index_subscriptions_on_chat_room_id", using: :btree
    t.index ["user_id"], name: "index_subscriptions_on_user_id", using: :btree
  end

  create_table "systemfinances", force: :cascade do |t|
    t.string   "name"
    t.float    "summa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transfers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "summa"
    t.index ["bank_id"], name: "index_transfers_on_bank_id", using: :btree
    t.index ["user_id"], name: "index_transfers_on_user_id", using: :btree
  end

  create_table "unread_messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_unread_messages_on_message_id", using: :btree
    t.index ["user_id"], name: "index_unread_messages_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "reffered_by"
    t.boolean  "admin",                  default: false
    t.float    "balance",                default: 0.0
    t.integer  "level",                  default: 0
    t.boolean  "carrier",                default: false
    t.boolean  "conductor",              default: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "proviant"
    t.boolean  "aerodrome",              default: false
    t.boolean  "radist",                 default: false
    t.datetime "last_seen"
    t.integer  "invited_by"
    t.string   "surname"
    t.string   "skype"
    t.string   "phone"
    t.string   "country"
    t.boolean  "bonus",                  default: false
    t.float    "ball"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "avatars", "users"
  add_foreign_key "common_chat_messages", "users"
  add_foreign_key "getbalances", "users"
  add_foreign_key "getmoneys", "users"
  add_foreign_key "identities", "users"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "payeers", "users"
  add_foreign_key "subscriptions", "chat_rooms"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "transfers", "banks"
  add_foreign_key "transfers", "users"
  add_foreign_key "unread_messages", "messages"
  add_foreign_key "unread_messages", "users"
end
