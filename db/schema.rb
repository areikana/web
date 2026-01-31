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

ActiveRecord::Schema[8.1].define(version: 2026_01_31_063138) do
  create_table "calorie_items", force: :cascade do |t|
    t.integer "calorie_record_id", null: false
    t.float "calories_per_unit"
    t.datetime "created_at", null: false
    t.string "name"
    t.float "quantity"
    t.string "unit"
    t.datetime "updated_at", null: false
    t.index ["calorie_record_id"], name: "index_calorie_items_on_calorie_record_id"
  end

  create_table "calorie_records", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.string "rec_id"
    t.float "total_calories"
    t.datetime "updated_at", null: false
    t.string "user_id_str"
    t.string "user_key"
  end

  create_table "cooks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "health"
    t.datetime "updated_at", null: false
  end

  create_table "memories", force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.string "meal_type"
    t.text "memo"
    t.string "rec_id"
    t.float "total_calories"
    t.datetime "updated_at", null: false
    t.string "user_id"
  end

  add_foreign_key "calorie_items", "calorie_records"
end
