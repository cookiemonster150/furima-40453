FactoryBot.define do
  factory :item do
    association :user
    item_name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 10) }
    condition_id { Faker::Number.between(from: 2, to: 10) } 
    postage_id { Faker::Number.between(from: 2, to: 10) }
    prefecture_id { Faker::Number.between(from: 2, to: 10) }
    day_id { Faker::Number.between(from: 2, to: 10) } 
    price { Faker::Number.between(from: 300, to: 9999999) } # 300から9999999の間のランダムな価格を生成
    after(:build) do |item|
    item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
   end
  end
end 
