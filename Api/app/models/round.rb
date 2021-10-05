class Round < ApplicationRecord
  belongs_to :game
  validates :points_a, :points_b, :multiplier, :turn, presence: true
  validates :points_a, numericality: { less_than: 3, greater_than_or_equal_to: 0 }
end
