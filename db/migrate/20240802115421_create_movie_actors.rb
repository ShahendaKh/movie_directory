# frozen_string_literal: true

# Creates movie actors join table table
class CreateMovieActors < ActiveRecord::Migration[7.1]
  def change
    create_table :movie_actors do |t|
      t.references :movie
      t.references :actor, foreign_key: { to_table: :people }
    end
  end
end
