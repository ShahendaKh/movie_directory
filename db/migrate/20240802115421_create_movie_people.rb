# frozen_string_literal: true

# Creates movie people join table table
class CreateMoviePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :movie_people do |t|
      t.references :movie
      t.references :person
    end
  end
end
