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

ActiveRecord::Schema.define(version: 20171002220120) do

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",    limit: 65535
    t.string   "object"
    t.string   "user"
    t.string   "panel"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "intequipments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "equipmentName"
    t.string   "ticketN"
    t.text     "remHS",         limit: 65535
    t.string   "userHS"
    t.text     "remOK",         limit: 65535
    t.string   "userOK"
    t.time     "duration"
    t.string   "panel"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["user_id"], name: "index_intequipments_on_user_id", using: :btree
  end

  create_table "intlines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "lineName"
    t.string   "ticketN"
    t.text     "remHS",      limit: 65535
    t.string   "userHS"
    t.text     "remOK",      limit: 65535
    t.string   "userOK"
    t.time     "duration"
    t.string   "panel"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_intlines_on_user_id", using: :btree
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "object"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "teamName"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.boolean  "activated",       default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "events", "users"
  add_foreign_key "intequipments", "users"
  add_foreign_key "intlines", "users"
end
