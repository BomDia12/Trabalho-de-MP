class Round < ApplicationRecord
  belongs_to :game
  validates :points_a, :points_b, :multiplier, :turn, presence: true
end
