# frozen_string_literal: true

# Creates movie reviews
class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content

      t.references :movie
      t.references :reviewer, foreign_key: { to_table: :people }

      t.timestamps
    end
  end
end
