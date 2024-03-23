FactoryBot.define do
  factory :item do
    association :user
    item_name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    category_id { Category.all.reject { |category| category.id == 1 }.sample.id}
    condition_id { Condition.all.reject { |condition| condition.id == 1 }.sample.id } 
    postage_id { Postage.all.reject { |postage| postage.id == 1 }.sample.id }
    prefecture_id { Prefecture.all.reject { |prefecture| prefecture.id == 1 }.sample.id }
    day_id { Day.all.reject { |day| day.id == 1 }.sample.id }
    price { Faker::Number.between(from: 300, to: 9999999) } # 300から9999999の間のランダムな価格を生成
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('public/image/test_image.png')), filename: 'test_image.png')
   end
  end
end 
