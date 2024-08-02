# frozen_string_literal: true

# Creates single interitance model
class Person < ApplicationRecord
  validates_presence_of :name, :type
end
