# frozen_string_literal: true

# Creates single interitance table
class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :type, null: false

      t.timestamps
    end
  end
end
