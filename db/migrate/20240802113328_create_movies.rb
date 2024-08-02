# frozen_string_literal: true

# Creates movies table
class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.integer :year
      t.references :director, foreign_key: { to_table: :people }

      t.timestamps
    end
    add_index :movies, :title, unique: true
  end
end
