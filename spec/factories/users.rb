FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { "1a" + Faker::Internet.password(min_length: 6)}
    full_width_last_name  {"野中"}
    full_width_first_name {"弘晴"}
    kana_last_name        {"ノナカ"}
    kana_first_name       {"コウセイ"}
    birthday              {"1996-10-10"}
  end
end