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

ActiveRecord::Schema.define(version: 20171111091915) do

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",    limit: 65535
    t.string   "object"
    t.string   "userName"
    t.string   "panel"
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["team_id"], name: "index_events_on_team_id", using: :btree
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
    t.datetime "closed_at"
    t.string   "panel"
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "closed",                      default: false
    t.index ["team_id"], name: "index_intequipments_on_team_id", using: :btree
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
    t.datetime "closed_at"
    t.string   "panel"
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "closed",                   default: false
    t.index ["team_id"], name: "index_intlines_on_team_id", using: :btree
    t.index ["user_id"], name: "index_intlines_on_user_id", using: :btree
  end

  create_table "issues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.string   "color"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_issues_on_team_id", using: :btree
  end

  create_table "lines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_lines_on_team_id", using: :btree
  end

  create_table "materials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_materials_on_team_id", using: :btree
  end

  create_table "teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "team_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.boolean  "activated",       default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["team_id"], name: "index_users_on_team_id", using: :btree
  end

  add_foreign_key "events", "teams"
  add_foreign_key "events", "users"
  add_foreign_key "intequipments", "teams"
  add_foreign_key "intequipments", "users"
  add_foreign_key "intlines", "teams"
  add_foreign_key "intlines", "users"
  add_foreign_key "issues", "teams"
  add_foreign_key "lines", "teams"
  add_foreign_key "materials", "teams"
  add_foreign_key "users", "teams"
end
