FactoryBot.define do
  factory :user_game do
    winner { false }
    user { create(:user) }
    player { rand(0..3) }
  end
end
