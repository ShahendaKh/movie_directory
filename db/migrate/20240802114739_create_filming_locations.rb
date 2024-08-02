# frozen_string_literal: true

# Creates filming locations table
class CreateFilmingLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :filming_locations do |t|
      t.string :name
      t.string :country_code

      t.timestamps
    end
    add_index :filming_locations, %i[name country_code], unique: true,
                                                         name: 'unique_index_location_name_and_country_code'
  end
end
