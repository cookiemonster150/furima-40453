FactoryBot.define do
  factory :address do
    association :user
    postal_code { Faker::Address.postcode }
    prefecture_id { Prefecture.all.reject { |prefecture| prefecture.id == 1 }.sample.id}
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building_name { "建物" }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
