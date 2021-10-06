FactoryBot.define do
  factory :user do
    email { 'user@email' }
    name { 'user name' }
    password { '123456' }
  end
end
