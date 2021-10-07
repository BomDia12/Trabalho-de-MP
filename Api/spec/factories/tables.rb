FactoryBot.define do
  factory :table do
    card_a { "♠ A" }
    card_b { "♥ 7" }
    card_c { "♦ 7" }
    card_d { "♣ 4" }
    round { create(:round) }
  end
end
