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

ActiveRecord::Schema.define(version: 2020_01_29_190615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "preparations", force: :cascade do |t|
    t.string "device", default: ""
    t.string "coffee_brand", default: ""
    t.string "coffee_name", default: ""
    t.integer "coffee_amount", default: 0
    t.string "coffee_grind", default: ""
    t.integer "total_water", default: 0
    t.integer "total_time", default: 0
    t.integer "water_temp", default: 200
    t.text "notes", default: ""
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_preparations_on_user_id"
  end

  create_table "steps", force: :cascade do |t|
    t.string "action", default: ""
    t.integer "duration", default: 0
    t.integer "amount", default: 0
    t.integer "order", default: 0
    t.string "directions", default: ""
    t.bigint "preparation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["preparation_id"], name: "index_steps_on_preparation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: ""
    t.string "email_address", default: ""
    t.string "password", default: ""
    t.boolean "has_aeropress", default: true
    t.boolean "has_chemex", default: false
    t.boolean "has_pourover", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "preparations", "users"
  add_foreign_key "steps", "preparations"
end
