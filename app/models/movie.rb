# frozen_string_literal: true

# Movie
class Movie < ApplicationRecord
  ######################### Validations #########################
  validates_presence_of :title, :description, :year, :director
  validates_uniqueness_of :title, case_sensitive: false

  ######################### Associations ########################
  has_many :movie_filming_locations, dependent: :destroy
  has_many :filming_locations, through: :movie_filming_locations, source: :filming_location
  has_many :movie_actors, dependent: :destroy
  has_many :actors, through: :movie_actors, source: :actor
  has_many :reviews, dependent: :destroy
  belongs_to :director
end
