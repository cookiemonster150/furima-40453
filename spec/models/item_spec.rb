require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe 'バリデーション' do
    context '商品出品できる場合' do
      it "item_name,description,category_id,condition_id,postage_id,prefecture_id,day_id" do
       expect(@item).to be_valid
      end
    end
   context '商品が出品できない' do
    it "item_nameが存在しない場合は無効であること" do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors[:item_name]).to include("can't be blank")
    end

    it "descriptionが存在しない場合は無効であること" do
      @item.description = nil
      @item.valid?
      expect(@item.errors[:description]).to include("can't be blank")
    end
    
      it "category_idがid_1の場合は無効" do
        valid_category_ids = Category.where.not(id: 1).pluck(:id)
         @item.category_id = valid_category_ids.sample
          expect(@item).to be_valid
         @item.category_id = 1
          expect(@item).not_to be_valid
      end
    
      it "condition_idがid_1の場合は無効" do
        valid_condition_ids = Condition.where.not(id: 1).pluck(:id)
         @item.condition_id = valid_condition_ids.sample
          expect(@item).to be_valid
         @item.condition_id = 1
          expect(@item).not_to be_valid
      end

      it "postage_idがid_1の場合は無効" do
        valid_postage_ids = Postage.where.not(id: 1).pluck(:id)
         @item.postage_id = valid_postage_ids.sample
          expect(@item).to be_valid
         @item.postage_id = 1
          expect(@item).not_to be_valid
      end

      it "prefecture_idがid_1の場合は無効" do
        valid_prefecture_ids = Prefecture.where.not(id: 1).pluck(:id)
         @item.prefecture_id = valid_prefecture_ids.sample
          expect(@item).to be_valid
         @item.prefecture_id = 1
          expect(@item).not_to be_valid
      end

    it "day_idがid_1の場合は無効" do
      valid_day_ids = Day.where.not(id: 1).pluck(:id)
       @item.day_id = valid_day_ids.sample
        expect(@item).to be_valid
       @item.day_id = 1
        expect(@item).not_to be_valid
    end

    it "価格が範囲を下回る場合は無効であること" do
      @item.price = 299
      @item.valid?
      expect(@item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "価格が範囲を超える場合は無効であること" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "priceが空では出品できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "価格が半角数字以外を含む場合は出品できない" do
      @item.price = "abc123" 
      @item.valid?
      expect(@item.errors[:price]).to include("is not a number")
    end

    it "userが紐付いていなければ出品できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors[:user]).to include("must exist")
    end

    it "imageが空では出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors[:image]).to include("can't be blank")
    end
  end
 end
end