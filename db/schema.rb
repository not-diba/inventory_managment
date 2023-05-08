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

ActiveRecord::Schema[7.0].define(version: 2023_05_08_113100) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "department_id"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id"
  end

  create_table "components", force: :cascade do |t|
    t.string "component_name"
    t.integer "quantity"
    t.boolean "returnable"
    t.bigint "lab_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unit_id"
    t.integer "room_id"
    t.text "remarks"
    t.index ["lab_id"], name: "index_components_on_lab_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "department_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "location"
    t.integer "administrator_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "equipment_name"
    t.string "make"
    t.string "serial_number"
    t.string "model_number"
    t.string "status"
    t.text "remarks"
    t.bigint "lab_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_id"
    t.index ["lab_id"], name: "index_equipment_on_lab_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.string "administrator_name"
    t.string "room_id"
    t.string "remarks"
    t.integer "quantity"
    t.string "unit"
    t.string "assigned_to"
    t.boolean "returned"
    t.bigint "lab_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lab_id"], name: "index_items_on_lab_id"
  end

  create_table "labs", force: :cascade do |t|
    t.string "lab_name"
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "administrator_id"
    t.index ["department_id"], name: "index_labs_on_department_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "unit_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "components", "labs"
  add_foreign_key "equipment", "labs"
  add_foreign_key "items", "labs"
  add_foreign_key "labs", "departments"
end
