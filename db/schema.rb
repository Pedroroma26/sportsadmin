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

ActiveRecord::Schema[7.0].define(version: 2023_03_14_164847) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.string "address"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.datetime "deleted_at"
    t.string "access_token"
    t.index ["deleted_at"], name: "index_clubs_on_deleted_at"
  end

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_competitions_on_deleted_at"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "competition_id", null: false
    t.bigint "club_home_id", null: false
    t.bigint "club_away_id", null: false
    t.bigint "referee_id", null: false
    t.datetime "game_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["club_away_id"], name: "index_games_on_club_away_id"
    t.index ["club_home_id"], name: "index_games_on_club_home_id"
    t.index ["competition_id"], name: "index_games_on_competition_id"
    t.index ["deleted_at"], name: "index_games_on_deleted_at"
    t.index ["referee_id"], name: "index_games_on_referee_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "player_number"
    t.date "birth_date"
    t.string "gender"
    t.bigint "club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["club_id"], name: "index_players_on_club_id"
    t.index ["deleted_at"], name: "index_players_on_deleted_at"
  end

  create_table "report_instances", force: :cascade do |t|
    t.string "category"
    t.integer "minute"
    t.text "motive"
    t.bigint "report_id", null: false
    t.bigint "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_report_instances_on_deleted_at"
    t.index ["player_id"], name: "index_report_instances_on_player_id"
    t.index ["report_id"], name: "index_report_instances_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.boolean "referee_validation", default: false
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_reports_on_game_id"
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
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "games", "clubs", column: "club_away_id"
  add_foreign_key "games", "clubs", column: "club_home_id"
  add_foreign_key "games", "competitions"
  add_foreign_key "games", "users", column: "referee_id"
  add_foreign_key "players", "clubs"
  add_foreign_key "report_instances", "players"
  add_foreign_key "report_instances", "reports"
  add_foreign_key "reports", "games"
end
