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

ActiveRecord::Schema[7.0].define(version: 2024_02_23_114925) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "configs", force: :cascade do |t|
    t.text "account_id"
    t.text "account_name"
    t.text "account_mail"
    t.text "introduction"
    t.integer "sum"
    t.text "town"
    t.date "birthday"
    t.string "icon1"
    t.string "icon2"
    t.boolean "activation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text "account_id"
    t.string "image"
    t.text "object_id"
    t.text "filename"
    t.text "extension"
    t.text "size"
    t.text "volume"
    t.decimal "x"
    t.decimal "y"
    t.decimal "z"
    t.text "text"
    t.boolean "activation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text "nickname"
    t.text "account_id"
    t.text "memo"
    t.integer "sum"
    t.text "town"
    t.date "birthday"
    t.string "icon1"
    t.string "icon2"
    t.boolean "activation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
