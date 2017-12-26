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

ActiveRecord::Schema.define(version: 20171226160607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "keywords", force: :cascade do |t|
    t.string "keyword"
    t.text "html"
    t.integer "ads_top_num"
    t.integer "ads_bottom_num"
    t.integer "ads_total_num"
    t.integer "non_ads_num"
    t.integer "total_links_num"
    t.string "total_search_results_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ads_top_urls", default: [], array: true
    t.string "ads_bottom_urls", default: [], array: true
    t.string "non_ads_urls", default: [], array: true
  end

end
