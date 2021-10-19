# frozen_string_literal: true

FactoryBot.define do
  factory :round do
    game { create(:game) }
    points_a { 1 }
    points_b { 1 }
    multiplier { 1 }
    multiplier_turn { 1 }
    turn { 1 }
    ended { false }
    hands { [] }
  end
end
