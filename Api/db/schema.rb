# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_06_001840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer "point_a"
    t.integer "point_b"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hands", force: :cascade do |t|
    t.string "card_a"
    t.string "card_b"
    t.string "card_c"
    t.integer "player"
    t.bigint "round_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["round_id"], name: "index_hands_on_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "winner"
    t.integer "points_a"
    t.integer "points_b"
    t.integer "multiplier"
    t.integer "multiplier_turn"
    t.integer "turn"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_rounds_on_game_id"
  end

  add_foreign_key "hands", "rounds"
  add_foreign_key "rounds", "games"
end
