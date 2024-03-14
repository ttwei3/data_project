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

ActiveRecord::Schema[7.1].define(version: 2024_03_14_012935) do
  create_table "breeds", force: :cascade do |t|
    t.string "breed_name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.string "dog_name"
    t.integer "dog_age"
    t.string "dog_gender"
    t.string "fav_food"
    t.integer "breed_id", null: false
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["breed_id"], name: "index_dogs_on_breed_id"
    t.index ["owner_id"], name: "index_dogs_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "owner_name"
    t.string "owner_address"
    t.string "owner_city"
    t.string "owner_province"
    t.string "owner_postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  add_foreign_key "dogs", "breeds"
  add_foreign_key "dogs", "owners"
end
