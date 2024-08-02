# frozen_string_literal: true

# Movie Actor
class Actor < Person
  has_many :movie_actors, dependent: :destroy
  has_many :movies, through: :movie_actors
end
