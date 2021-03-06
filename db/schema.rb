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

ActiveRecord::Schema.define(:version => 20130507011541) do

  create_table "components", :force => true do |t|
    t.integer  "element_id"
    t.integer  "specification_id"
    t.integer  "package_id"
    t.string   "supplier"
    t.integer  "stock"
    t.decimal  "price"
    t.text     "info"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "elements", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "packages", :force => true do |t|
    t.string   "name"
    t.integer  "specification_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "pcb_boms", :force => true do |t|
    t.string   "name"
    t.integer  "comp_id"
    t.text     "mark"
    t.integer  "count"
    t.text     "info"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "specifications", :force => true do |t|
    t.string   "name"
    t.integer  "element_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
