# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100328014915) do

  create_table "contact_infos", :force => true do |t|
    t.string "slug"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "email"
  end

  create_table "images", :force => true do |t|
    t.string   "filename"
    t.datetime "created_at"
  end

  create_table "snippets", :force => true do |t|
    t.string   "slug"
    t.text     "text"
    t.text     "compiled_text"
    t.string   "parser"
    t.text     "notes"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nav_title"
    t.string   "tagline"
    t.string   "header_title"
    t.integer  "image_id"
    t.boolean  "nav_item"
    t.integer  "nav_position"
    t.boolean  "core_page"
  end

  add_index "snippets", ["slug"], :name => "index_snippets_on_slug"

end
