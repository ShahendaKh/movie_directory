# frozen_string_literal: true

# Movie Review
class Review < ApplicationRecord
  ######################### Validations #########################
  validates_presence_of :rating, :content
  validates_uniqueness_of :reviewer, scope: %i[movie], case_sensitive: false
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  ######################### Associations ########################
  belongs_to :movie
  belongs_to :reviewer
end
