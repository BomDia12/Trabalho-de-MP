# frozen_string_literal: true

FactoryBot.define do
  factory :round do
    game { create(:game) }
    points_a { 0 }
    points_b { 0 }
    multiplier { 1 }
    multiplier_turn { 1 }
    turn { 1 }
    ended { false }
  end
end
