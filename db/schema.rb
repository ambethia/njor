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

ActiveRecord::Schema.define(version: 2020_11_17_141115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.bigint "specialization_id", null: false
    t.bigint "category_id"
    t.string "name"
    t.string "subtext"
    t.boolean "is_talent"
    t.boolean "is_passive"
    t.integer "spell_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_abilities_on_category_id"
    t.index ["specialization_id"], name: "index_abilities_on_specialization_id"
  end

  create_table "action_bars", force: :cascade do |t|
    t.bigint "keymap_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["keymap_id"], name: "index_action_bars_on_keymap_id"
  end

  create_table "action_buttons", force: :cascade do |t|
    t.bigint "action_bar_id", null: false
    t.bigint "category_id", null: false
    t.integer "slot"
    t.string "hotkey"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["action_bar_id"], name: "index_action_buttons_on_action_bar_id"
    t.index ["category_id"], name: "index_action_buttons_on_category_id"
  end

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "main"
    t.string "name"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "keybinds", force: :cascade do |t|
    t.bigint "specialization_id", null: false
    t.bigint "action_button_id", null: false
    t.bigint "ability_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ability_id"], name: "index_keybinds_on_ability_id"
    t.index ["action_button_id"], name: "index_keybinds_on_action_button_id"
    t.index ["specialization_id"], name: "index_keybinds_on_specialization_id"
  end

  create_table "keymaps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "playable_classes", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string "name"
    t.json "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "specializations", force: :cascade do |t|
    t.bigint "playable_class_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["playable_class_id"], name: "index_specializations_on_playable_class_id"
  end

  add_foreign_key "abilities", "categories"
  add_foreign_key "abilities", "specializations"
  add_foreign_key "action_bars", "keymaps"
  add_foreign_key "action_buttons", "action_bars"
  add_foreign_key "action_buttons", "categories"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "keybinds", "abilities"
  add_foreign_key "keybinds", "action_buttons"
  add_foreign_key "keybinds", "specializations"
  add_foreign_key "specializations", "playable_classes"
end
