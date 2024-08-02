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

ActiveRecord::Schema[7.1].define(version: 2024_08_02_124314) do
  create_table "filming_locations", force: :cascade do |t|
    t.string "name"
    t.string "country_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "country_code"], name: "unique_index_location_name_and_country_code", unique: true
  end

  create_table "movie_actors", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "actor_id"
    t.index ["actor_id"], name: "index_movie_actors_on_actor_id"
    t.index ["movie_id"], name: "index_movie_actors_on_movie_id"
  end

  create_table "movie_filming_locations", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "filming_location_id"
    t.index ["filming_location_id"], name: "index_movie_filming_locations_on_filming_location_id"
    t.index ["movie_id"], name: "index_movie_filming_locations_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "year"
    t.integer "director_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["director_id"], name: "index_movies_on_director_id"
    t.index ["title"], name: "index_movies_on_title", unique: true
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.integer "movie_id"
    t.integer "reviewer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  add_foreign_key "movie_actors", "people", column: "actor_id"
  add_foreign_key "movies", "people", column: "director_id"
  add_foreign_key "reviews", "people", column: "reviewer_id"
end
