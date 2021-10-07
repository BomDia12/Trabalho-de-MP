# frozen_string_literal: true

FactoryBot.define do
  factory :hand do
    card_a { '♠ 3' }
    card_b { '♥ 2' }
    card_c { '♦ 2' }
    player { 1 }
    round { create(:round) }
  end
end
