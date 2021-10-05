class Round < ApplicationRecord
  belongs_to :game
  validates :points_a, presence: true
end
