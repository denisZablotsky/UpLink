# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_31_135002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "song_users", force: :cascade do |t|
    t.integer "song_id"
    t.integer "user_id"
  end

  create_table "song_words", force: :cascade do |t|
    t.integer "song_id"
    t.integer "word_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.string "cover_url"
    t.string "lyric"
    t.integer "lyric_id"
    t.string "checksum"
  end

  create_table "translations", force: :cascade do |t|
    t.string "value"
    t.string "picture_url"
    t.integer "word_id"
    t.index ["word_id"], name: "index_translations_on_word_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.string "value"
    t.string "transcription"
    t.string "sound_url"
    t.integer "status"
    t.integer "user_id"
    t.index ["user_id"], name: "index_words_on_user_id"
  end

end
