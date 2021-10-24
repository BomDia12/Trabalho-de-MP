# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :rounds
  has_many :user_games
  has_many :users, through: :user_games
  validates :point_a, :point_b, presence: true
  validates :point_a, :point_b, numericality: { less_than_or_equal_to: 12, greater_than_or_equal_to: 0 }
end
