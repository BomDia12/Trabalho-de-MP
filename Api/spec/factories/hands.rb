FactoryBot.define do
  factory :hand do
    card_a { "MyString" }
    card_b { "MyString" }
    card_c { "MyString" }
    player { 1 }
    round { nil }
  end
end
