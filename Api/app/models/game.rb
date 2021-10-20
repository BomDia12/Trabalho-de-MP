# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :rounds
  validates :point_a, :point_b, presence: true
  validates :point_a, :point_b, numericality: { less_than_or_equal_to: 12, greater_than_or_equal_to: 0 }
end
