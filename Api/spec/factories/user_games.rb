FactoryBot.define do
  factory :user_game do
    winner { nil }
    user { create(:user) }
    game { create(:game) }
    player { rand(0..3) }
  end
end
