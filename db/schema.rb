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

ActiveRecord::Schema.define(version: 20150713201801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "commenter_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "experiments", force: :cascade do |t|
    t.string   "name"
    t.text     "results"
    t.text     "conclusion"
    t.integer  "project_id"
    t.integer  "experimenter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "observations", force: :cascade do |t|
    t.text     "content"
    t.integer  "observable_id"
    t.string   "observable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "observations", ["observable_type", "observable_id"], name: "index_observations_on_observable_type_and_observable_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.string "title"
  end

  create_table "procedures", force: :cascade do |t|
    t.text     "instructions"
    t.integer  "experiment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "hypothesis"
    t.integer  "creator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "researcher_projects", force: :cascade do |t|
    t.integer  "researcher_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "position_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
