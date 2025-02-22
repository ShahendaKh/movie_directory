# frozen_string_literal: true

# Filming Location
class FilmingLocation < ApplicationRecord
  ######################### Validations #########################
  validates_presence_of :name, :country_code
  validates_uniqueness_of :name, scope: %i[country_code], case_sensitive: false

  scope :by_name_and_country_code, ->(name, country_code) { where(name: name, country_code: country_code) }
end
