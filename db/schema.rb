# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111026083630) do

  create_table "fan_arts", :force => true do |t|
    t.integer  "context_id",    :null => false
    t.string   "sequence",      :null => false
    t.string   "title"
    t.string   "author"
    t.string   "image_url"
    t.string   "thumbnail_url"
    t.datetime "published_at"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fan_arts", ["author"], :name => "index_fan_arts_on_author"
  add_index "fan_arts", ["context_id", "sequence"], :name => "index_fan_arts_on_context_id_and_sequence", :unique => true

  create_table "sequence_ques", :force => true do |t|
    t.integer  "context_id",                 :null => false
    t.string   "sequence",                   :null => false
    t.integer  "error_count", :default => 0
    t.string   "last_error"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", :force => true do |t|
    t.integer  "topic",      :null => false
    t.text     "sequences"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
