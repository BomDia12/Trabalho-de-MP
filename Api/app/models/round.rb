class Round < ApplicationRecord
  belongs_to :game
  validates :points_a, :points_b, presence: true
end
