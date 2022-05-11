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

ActiveRecord::Schema[7.0].define(version: 2022_05_11_192113) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.string "client"
    t.datetime "start_at"
    t.datetime "stop_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "heart_rates", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.datetime "time"
    t.integer "rate", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_heart_rates_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "name"
    t.string "code"
    t.string "username"
    t.string "password"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_teams_on_game_id"
  end

  add_foreign_key "heart_rates", "teams"
  add_foreign_key "teams", "games"
end
