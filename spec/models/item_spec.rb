require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'バリデーション' do
    context '商品出品できる場合' do
      it "item_name,description,category_id,condition_id,postage_id,prefecture_id,day_id" do
       item = FactoryBot.create(:item) # テスト用のitemオブジェクトを作成する
       expect(item).to be_valid
      end
    end
   context '商品が出品できない' do
    it "item_nameが存在しない場合は無効であること" do
      item = Item.new(item_name: nil)
      item.valid?
      expect(item.errors[:item_name]).to include("can't be blank")
    end

    it "descriptionが存在しない場合は無効であること" do
      item = Item.new(description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end
    
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

    it "価格が範囲を下回る場合は無効であること" do
      item = Item.new(price: 299)
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "価格が範囲を超える場合は無効であること" do
      item = Item.new(price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include("must be less than or equal to 9999999")
    end
  end
 end
end