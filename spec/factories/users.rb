FactoryBot.define do
  factory :user do
    first_name { "田中" }
    last_name {"颯透"}
    first_name_kana {"タナカ" }
    last_name_kana { "ハヤト" }
    nickname { Faker::Name.name }
    date_of_birth {Faker::Date.birthday}
    email {Faker::Internet.email}
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
  end
end
