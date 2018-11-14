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

ActiveRecord::Schema.define(version: 2018_11_14_024229) do

  create_table "feed_sources", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.string "feed_type"
    t.integer "num_articles"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.datetime "pub_date"
    t.text "description"
    t.string "category"
    t.integer "feed_source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_source_id"], name: "index_items_on_feed_source_id"
  end

end
