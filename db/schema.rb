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

ActiveRecord::Schema.define(version: 20160120163754) do

  create_table "clues", force: :cascade do |t|
    t.integer  "game_board_id", null: false
    t.integer  "place_id",      null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "clues", ["game_board_id", "place_id"], name: "index_clues_on_game_board_id_and_place_id", unique: true
  add_index "clues", ["game_board_id"], name: "index_clues_on_game_board_id"
  add_index "clues", ["place_id"], name: "index_clues_on_place_id"

  create_table "game_actions", force: :cascade do |t|
    t.string   "type"
    t.integer  "location_id"
    t.integer  "travel_id"
    t.datetime "start_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "game_boards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "started"
  end

  create_table "in_the_news_headlines", force: :cascade do |t|
    t.string   "headline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "in_the_news_places", force: :cascade do |t|
    t.integer  "game_board_id",           null: false
    t.integer  "place_id",                null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "in_the_news_headline_id", null: false
  end

  add_index "in_the_news_places", ["game_board_id", "place_id"], name: "index_in_the_news_places_on_game_board_id_and_place_id", unique: true
  add_index "in_the_news_places", ["game_board_id"], name: "index_in_the_news_places_on_game_board_id"
  add_index "in_the_news_places", ["in_the_news_headline_id"], name: "index_in_the_news_places_on_in_the_news_headline_id"
  add_index "in_the_news_places", ["place_id"], name: "index_in_the_news_places_on_place_id"

  create_table "investigators", force: :cascade do |t|
    t.string   "name",                       null: false
    t.string   "gender",                     null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "profession_id",              null: false
    t.integer  "influence",                  null: false
    t.integer  "observation",                null: false
    t.integer  "game_board_id",              null: false
    t.integer  "clues",          default: 0, null: false
    t.integer  "game_action_id"
  end

  add_index "investigators", ["game_action_id"], name: "index_investigators_on_game_action_id"

  create_table "place_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "place_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "place_anc_desc_idx", unique: true
  add_index "place_hierarchies", ["descendant_id"], name: "place_desc_idx"

  create_table "places", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "parent_id"
  end

  create_table "professions", force: :cascade do |t|
    t.string   "name",           null: false
    t.integer  "start_place_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "influence",      null: false
    t.integer  "observation",    null: false
  end

  create_table "travels", force: :cascade do |t|
    t.integer  "place_from_id",               null: false
    t.integer  "place_to_id",                 null: false
    t.float    "cost",          default: 0.0, null: false
    t.time     "duration",                    null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
