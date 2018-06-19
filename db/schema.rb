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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171221224935) do

  create_table "cities", force: :cascade do |t|
    t.string  "name",         limit: 35, default: "", null: false
    t.string  "country_code", limit: 3,  default: "", null: false
    t.string  "district",     limit: 20, default: "", null: false
    t.integer "population",   limit: 4,  default: 0,  null: false
    t.integer "country_id",   limit: 4,               null: false
  end

  add_index "cities", ["country_id"], name: "fk_cities_countries1_idx", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string  "code",            limit: 3,  default: "",     null: false
    t.string  "name",            limit: 52, default: "",     null: false
    t.string  "continent",       limit: 13, default: "Asia", null: false
    t.string  "region",          limit: 26, default: "",     null: false
    t.float   "surface_area",    limit: 24, default: 0.0,    null: false
    t.integer "indep_year",      limit: 2
    t.integer "population",      limit: 4,  default: 0,      null: false
    t.float   "life_expectancy", limit: 24
    t.float   "gnp",             limit: 24
    t.float   "gnp_old",         limit: 24
    t.string  "local_name",      limit: 45, default: "",     null: false
    t.string  "government_form", limit: 45, default: "",     null: false
    t.string  "head_of_state",   limit: 60
    t.integer "capital",         limit: 4
    t.string  "code2",           limit: 2,  default: "",     null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string  "country_code", limit: 3,  default: "",  null: false
    t.string  "language",     limit: 30, default: "",  null: false
    t.string  "is_official",  limit: 1,  default: "F", null: false
    t.float   "percentage",   limit: 24, default: 0.0, null: false
    t.integer "country_id",   limit: 4,                null: false
  end

  add_index "languages", ["country_id"], name: "fk_languages_countries_idx", using: :btree

  add_foreign_key "cities", "countries", name: "fk_cities_countries1"
  add_foreign_key "languages", "countries", name: "fk_languages_countries"
end
