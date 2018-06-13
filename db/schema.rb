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

ActiveRecord::Schema.define(version: 20180607160946) do

  create_table "requests", force: :cascade do |t|
    t.string "scheme"
    t.string "method"
    t.string "remote_ip"
    t.string "params"
    t.string "trap_id"
    t.text "headers"
    t.text "query_string"
    t.text "cookies"
    t.text "request_env"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "traps", id: :string, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "sqlite_autoindex_traps_1", unique: true
  end

end
