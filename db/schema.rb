# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_23_200635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "review_types", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id"
    t.bigint "review_type_id"
    t.bigint "tv_show_id", null: false
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.datetime "scheduled_date"
    t.integer "votes"
    t.integer "revenue"
    t.index ["review_type_id"], name: "index_reviews_on_review_type_id"
    t.index ["tv_show_id"], name: "index_reviews_on_tv_show_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "group_id"
    t.string "color"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.index ["group_id"], name: "index_teams_on_group_id"
  end

  create_table "tv_shows", force: :cascade do |t|
    t.string "name"
    t.string "show_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "reviews", "review_types"
  add_foreign_key "reviews", "tv_shows"
  add_foreign_key "reviews", "users"
  add_foreign_key "teams", "groups"
  add_foreign_key "users", "teams"

  create_view "latest_reviews", sql_definition: <<-SQL
      SELECT rev.id,
      rev.tv_show_id,
      rev.description,
      rev.title,
      rev.status,
      rev.scheduled_date,
      rev.votes,
      rev.revenue,
      usr.name AS user_name,
      usr.email AS user_email,
      tms.name AS team_name,
      gps.name AS group_name,
      (rev.revenue / rev.votes) AS revenue_per_vote,
      concat(gps.id, '-', rev.id) AS uid
     FROM ((((reviews rev
       JOIN users usr ON ((usr.id = rev.user_id)))
       JOIN teams tms ON ((tms.id = usr.team_id)))
       JOIN groups gps ON ((gps.id = tms.group_id)))
       JOIN review_types rev_tp ON ((rev_tp.id = rev.review_type_id)))
    WHERE ((usr.status = 0) AND (tms.status = ANY (ARRAY[0, 1])) AND (rev.status = ANY (ARRAY[0, 1])) AND (rev.scheduled_date <= now()))
    GROUP BY rev.id, usr.name, usr.email, tms.name, gps.name, gps.created_at, gps.id
    ORDER BY rev.created_at, gps.created_at;
  SQL
end
