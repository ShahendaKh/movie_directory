# frozen_string_literal: true

# Creates movie filming locations join table
class CreateMovieFilmingLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :movie_filming_locations do |t|
      t.references :movie
      t.references :filming_location
    end
  end
end
