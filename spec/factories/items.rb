FactoryBot.define do
  factory :item do
    category_id { Faker::Number.between(from: 2, to: 10) } # 1以外の無効なカテゴリーID
    condition_id { Faker::Number.between(from: 2, to: 10) } # 1以外の無効なcondition_id
    postage_id { Faker::Number.between(from: 2, to: 10) } # 1以外の無効なpostage_id
    prefecture_id { Faker::Number.between(from: 2, to: 10) } # 1以外の無効なprefecture_id
    day_id { Faker::Number.between(from: 2, to: 10) } # 1以外の無効なday_id
  end
end 
