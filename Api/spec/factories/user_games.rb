FactoryBot.define do
  factory :user_game do
    winner { false }
    user { create(:user) }
  end
end
