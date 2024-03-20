FactoryBot.define do
  factory :user do
    first_name {Faker::Name.last_name}
    last_name {Faker::Name.last_name}
    first_name_kana {Faker::Name.last_name}
    last_name_kana {Faker::Name.last_name}
    nickname {Faker::Name.last_name}
    date_of_birth {Faker::Date.birthday}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
