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

ActiveRecord::Schema.define(version: 20150410161614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "individuals", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "individuals_job_casts", id: false, force: :cascade do |t|
    t.integer "individual_id"
    t.integer "job_cast_id"
  end

  add_index "individuals_job_casts", ["individual_id", "job_cast_id"], name: "index_individuals_job_casts_on_individual_id_and_job_cast_id", using: :btree

  create_table "job_casts", force: :cascade do |t|
    t.integer  "organization_id"
    t.string   "title"
    t.text     "description"
    t.integer  "compensation_min"
    t.integer  "compensation_max"
    t.text     "skills"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country_code"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "job_casts", ["organization_id"], name: "index_job_casts_on_organization_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
