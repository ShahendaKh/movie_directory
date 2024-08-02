# frozen_string_literal: true

# Person single interitance model to handle different types of people
class Person < ApplicationRecord
  VALID_PERSON_TYPES = %w[Actor Director Reviewer].freeze

  ######################### Validations #########################
  validates_presence_of :name, :type
  validates :type, presence: true, inclusion: { in: VALID_PERSON_TYPES }

  ######################### Associations ########################
end
