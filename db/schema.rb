# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_07_123639) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "abreviation"
    t.string "address"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.bigint "competition_id", null: false
    t.bigint "club_home_id", null: false
    t.bigint "club_away_id", null: false
    t.bigint "referee_id", null: false
    t.datetime "game_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_away_id"], name: "index_games_on_club_away_id"
    t.index ["club_home_id"], name: "index_games_on_club_home_id"
    t.index ["competition_id"], name: "index_games_on_competition_id"
    t.index ["referee_id"], name: "index_games_on_referee_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "gender"
    t.bigint "club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_players_on_club_id"
  end

  create_table "reports", force: :cascade do |t|
    t.boolean "referee_validation", default: false
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_reports_on_game_id"
  end

  create_table "reports_instances", force: :cascade do |t|
    t.string "type"
    t.integer "minute"
    t.text "motive"
    t.bigint "report_id", null: false
    t.bigint "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_reports_instances_on_player_id"
    t.index ["report_id"], name: "index_reports_instances_on_report_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "city"
    t.string "phone_number"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "clubs", column: "club_away_id"
  add_foreign_key "games", "clubs", column: "club_home_id"
  add_foreign_key "games", "competitions"
  add_foreign_key "games", "users", column: "referee_id"
  add_foreign_key "players", "clubs"
  add_foreign_key "reports", "games"
  add_foreign_key "reports_instances", "players"
  add_foreign_key "reports_instances", "reports"
end
