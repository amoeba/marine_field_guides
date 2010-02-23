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

ActiveRecord::Schema.define(:version => 20100223222428) do

  create_table "abundances", :force => true do |t|
    t.integer  "species_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", :force => true do |t|
    t.integer  "species_id"
    t.string   "name"
    t.string   "value"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "morph"
  end

  create_table "common_names", :force => true do |t|
    t.integer  "species_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "distinguishing_characters", :force => true do |t|
    t.integer  "species_id"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "distributions", :force => true do |t|
    t.integer  "species_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "habitats", :force => true do |t|
    t.integer  "species_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer  "species_id"
    t.string   "image_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "natural_histories", :force => true do |t|
    t.integer  "species_id"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "similar_species", :force => true do |t|
    t.integer  "species_id"
    t.integer  "similar_species_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "species", :force => true do |t|
    t.string   "scientific_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "synonyms", :force => true do |t|
    t.integer  "species_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxonomies", :force => true do |t|
    t.integer  "species_id"
    t.string   "kingdom"
    t.string   "phylum"
    t.string   "klass"
    t.string   "order"
    t.string   "family"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "domain"
    t.string   "subkingdom"
    t.string   "superphylum"
    t.string   "subphylum"
    t.string   "superclass"
    t.string   "subclass"
    t.string   "superorder"
    t.string   "suborder"
    t.string   "superfamily"
    t.string   "subfamily"
    t.string   "genus"
    t.string   "species_name"
    t.string   "subspecies"
  end

end
