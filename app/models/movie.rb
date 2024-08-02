# frozen_string_literal: true

# Movie
class Movie < ApplicationRecord
  ######################### Validations #########################
  validates_presence_of :title, :description, :year
  validates_uniqueness_of :title, case_sensitive: false

  ######################### Associations ########################
  has_many :movie_filming_locations
  has_many :filming_locations, through: :movie_filming_locations, source: :filming_location
  has_many :movie_people
  has_many :actors, -> { where(type: 'Actor') }, through: :movie_people, source: :person
  belongs_to :director
end
