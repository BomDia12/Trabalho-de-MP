# frozen_string_literal: true

class Round < ApplicationRecord
  belongs_to :game
  validates :points_a, :points_b, :multiplier, :turn, presence: true
  validates :points_a, :points_b, numericality: { less_than: 3, greater_than_or_equal_to: 0 }
  validates :multiplier, inclusion: { in: [1, 3, 6, 9, 12] }
  validates :multiplier_turn, :turn, inclusion: 0..3
end
