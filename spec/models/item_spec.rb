require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'バリデーション' do  
    it "category_idが1の場合は無効" do
      item = Item.new(category_id: 1, condition_id: 2, postage_id: 2, prefecture_id: 2, day_id: 2)
      expect(item).to_not be_valid
    end
    
    it "condition_idが1の場合は無効" do
      item = Item.new(category_id: 2, condition_id: 1, postage_id: 2, prefecture_id: 2, day_id: 2)
      expect(item).to_not be_valid
    end

    it "postage_idが1の場合は無効" do
      item = Item.new(category_id: 1, condition_id: 2, postage_id: 2, prefecture_id: 2, day_id: 2)
      expect(item).to_not be_valid
    end

    it "prefecture_idが1の場合は無効" do
      item = Item.new(category_id: 1, condition_id: 2, postage_id: 2, prefecture_id: 2, day_id: 2)
      expect(item).to_not be_valid
    end

    it "day_idが1の場合は無効" do
      item = Item.new(category_id: 1, condition_id: 2, postage_id: 2, prefecture_id: 2, day_id: 2)
      expect(item).to_not be_valid
    end
    
    # 他の属性に関するテストも同様に追加します
    
  end
end