# frozen_string_literal: true

# Movie Reviewer
class Reviewer < Person
  has_many :reviews, dependent: :destroy
end
