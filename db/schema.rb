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

ActiveRecord::Schema.define(version: 20190412220417) do

  create_table "resource_metadata", force: :cascade do |t|
    t.string "Title"
    t.string "Author"
    t.date "publish_date"
    t.string "Abstract"
    t.string "Link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_tags", force: :cascade do |t|
    t.integer "resource_id"
    t.integer "tag_id"
    t.index ["resource_id"], name: "index_resource_tags_on_resource_id"
    t.index ["tag_id"], name: "index_resource_tags_on_tag_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
    t.index ["role_id"], name: "index_roles_users_on_role_id"
    t.index ["user_id"], name: "index_roles_users_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "Tag_Title"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.boolean "is_deleted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
