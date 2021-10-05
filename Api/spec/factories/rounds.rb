FactoryBot.define do
  factory :round do
    game { create(:game) }
    winner { "MyString" }
    points_a { 1 }
    points_b { 1 }
    multiplier { 1 }
    multiplier_turn { 1 }
    turn { 1 }
  end
end
