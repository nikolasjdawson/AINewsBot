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

ActiveRecord::Schema.define(version: 2019_03_26_054237) do

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "day_of_weeks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feed_sources", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.string "feed_type"
    t.integer "num_articles"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.index ["category_id"], name: "index_feed_sources_on_category_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
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
    t.string "host"
    t.index ["feed_source_id"], name: "index_items_on_feed_source_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "news_source_id"
    t.string "liker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["news_source_id", "liker"], name: "index_likes_on_news_source_id_and_liker", unique: true
    t.index ["news_source_id"], name: "index_likes_on_news_source_id"
  end

  create_table "mailkick_opt_outs", force: :cascade do |t|
    t.string "email"
    t.string "user_type"
    t.integer "user_id"
    t.boolean "active", default: true, null: false
    t.string "reason"
    t.string "list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_mailkick_opt_outs_on_email"
    t.index ["user_type", "user_id"], name: "index_mailkick_opt_outs_on_user_type_and_user_id"
  end

  create_table "news_sources", force: :cascade do |t|
    t.integer "likes"
    t.string "link"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_accepted", default: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "intro"
    t.text "body"
    t.string "image"
    t.date "pub_date"
    t.string "slug"
    t.boolean "is_published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.string "host"
    t.string "admin_email"
    t.string "logo"
    t.string "favicon_link"
    t.string "mailgun_key"
    t.string "mailgun_domain"
    t.text "intro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriber_days", force: :cascade do |t|
    t.integer "subscriber_id"
    t.integer "day_of_week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_of_week_id"], name: "index_subscriber_days_on_day_of_week_id"
    t.index ["subscriber_id"], name: "index_subscriber_days_on_subscriber_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_confirmed", default: false
    t.boolean "is_subscribed", default: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
