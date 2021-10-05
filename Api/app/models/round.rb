class Round < ApplicationRecord
  belongs_to :game
  validates :points_a, :points_b, :multiplier, presence: true
end
