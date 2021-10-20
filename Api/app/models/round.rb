# frozen_string_literal: true

class ValidateEnded < ActiveModel::Validator
  def validate(record)
    if record.ended == true and (record.points_a < 2 and record.points_b < 2)
      record.errors.add :ended, 'can not be true if no team has 2 points'
    elsif record.ended == true and (record.points_a == 2 and record.points_b == 2)
      record.errors.add :ended, 'two teams can not have two points at the same time'
    end
  end
end

class ValidateNumHands < ActiveModel::Validator
  def validate(record)
    record.errors.add :hands, 'too many hands' if record.hands.size > 4
  end
end

class Round < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :game
  validates :points_a, :points_b, :multiplier, :turn, presence: true
  validates :points_a, :points_b, numericality: { less_than: 3, greater_than_or_equal_to: 0 }
  validates :multiplier, inclusion: { in: [1, 3, 6, 9, 12] }
  validates :multiplier_turn, inclusion: [*0..3, nil]
  validates :turn, inclusion: 0..3
  validates :ended, inclusion: [true, false], exclusion: [nil]
  validates_with ValidateEnded
  has_many :hands
  has_many :tables
  validates_with ValidateNumHands
end
