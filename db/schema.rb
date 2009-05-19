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

ActiveRecord::Schema.define(:version => 20090519041537) do

  create_table "assertions", :force => true do |t|
    t.integer  "predicate_id"
    t.integer  "domain_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domains", :force => true do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  add_index "entities", ["permalink"], :name => "index_entities_on_permalink"

  create_table "parameters", :force => true do |t|
    t.integer  "sort"
    t.integer  "assertion_id"
    t.integer  "entity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "predicates", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "triples", :force => true do |t|
    t.integer  "predicate_id"
    t.integer  "author_id"
    t.integer  "domain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subject_id"
    t.integer  "object_id"
  end

  add_index "triples", ["object_id"], :name => "index_triples_on_object_id"
  add_index "triples", ["subject_id"], :name => "index_triples_on_subject_id"

end
