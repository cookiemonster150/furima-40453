require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end
  describe 'バリデーション' do
    context '購入できる場合' do
      it "postal_code,prefecture_id,city,house_number,building_name,phone_number" do
        expect(@order_address).to be_valid
      end
    end

    context '購入できない場合' do
      it "postal_codeが空では登録できない" do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal_code can't be blank")
      end

      it "cityが空では登録できない" do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it "house_numberが空では登録できない" do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House_number can't be blank")
      end

      it "phone_numberが空では登録できない" do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone_number can't be blank")
      end

      it "building_nameが空でも登録できる" do
        @order_address.building_name = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Building_name can't be blank")
      end

      it "postal_codeが存在しない場合は無効であること" do
        @order_address.item_name = nil
        @order_address.valid?
        expect(@order_address.errors[:postal_code]).to include("can't be blank")
      end
  
      it "descriptionが存在しない場合は無効であること" do
        @order_address.description = nil
        @order_address.valid?
        expect(@order_address.errors[:description]).to include("can't be blank")
      end
      
        it "prefecture_idが存在しない場合は無効であること" do
          @order_address.item_name = nil
          @order_address.valid?
          expect(@order_address.errors[:prefecture_id]).to include("can't be blank")
        end
      
        it "cityが存在しない場合は無効であること" do
          @order_address.item_name = nil
          @order_address.valid?
          expect(@order_address.errors[:city]).to include("can't be blank")
        end
  
        it "house_numberが存在しない場合は無効であること" do
          @order_address.item_name = nil
          @order_address.valid?
          expect(@order_address.errors[:house_number]).to include("can't be blank")
        end
  
        it "prefecture_idの場合は無効" do
          valid_prefecture_ids = Prefecture.where.not(id: 1).pluck(:id)
           @order_address.prefecture_id = valid_prefecture_ids.sample
            expect(@order_address).to be_valid
           @order_address.prefecture_id = 1
            expect(@order_address).not_to be_valid
        end
  
      it "phone_numberが存在しない場合は無効であること" do
        @order_address.item_name = nil
        @order_address.valid?
        expect(@order_address.errors[:phone_number]).to include("can't be blank")
      end

      it '郵便番号が短すぎる場合は無効であること' do
        order_address = FactoryBot.build(:order_address, postal_code: '12-3456')
        expect(order_address).to be_invalid
      end
  
      it '郵便番号が長すぎる場合は無効であること' do
        order_address = FactoryBot.build(:order_address, postal_code: '1234-56789')
        expect(order_address).to be_invalid
      end
  
      it '郵便番号に文字が含まれている場合は無効であること' do
        order_address = FactoryBot.build(:order_address, postal_code: 'abc-defg')
        expect(order_address).to be_invalid
      end

      it '不正なフォーマットでは無効であること' do
        order_address = FactoryBot.build(:order_address, city: 'Yokohama')
        expect(order_address).to be_invalid
      end
  
      it '数字が含まれている場合は無効であること' do
        order_address = FactoryBot.build(:order_address, city: '横浜1区')
        expect(order_address).to be_invalid
      end
  
      it '特殊文字が含まれている場合は無効であること' do
        order_address = FactoryBot.build(:order_address, city: '横浜市-緑区')
        expect(order_address).to be_invalid
      end
  
      it '空白文字のみの場合は無効であること' do
        order_address = FactoryBot.build(:order_address, city: ' ')
        expect(order_address).to be_invalid
      end

      it '不正なフォーマットでは無効であること' do
        order_address = FactoryBot.build(:order_address, house_number: '1号室')
        expect(order_address).to be_invalid
      end
  
      it '特殊文字が含まれている場合は無効であること' do
        order_address = FactoryBot.build(:order_address, house_number: '1-1号室')
        expect(order_address).to be_invalid
      end
  
      it '空白文字のみの場合は無効であること' do
        order_address = FactoryBot.build(:order_address, house_number: ' ')
        expect(order_address).to be_invalid
      end

      it '9桁の場合は無効であること' do
        order_address = FactoryBot.build(:order_address, phone_number: '123456789')
        expect(order_address).to be_invalid
      end
  
      it '12桁以上の場合は無効であること' do
        order_address = FactoryBot.build(:order_address, phone_number: '123456789012')
        expect(order_address).to be_invalid
      end
  
      it '文字列を含む場合は無効であること' do
        order_address = FactoryBot.build(:order_address, phone_number: '090abcd5678')
        expect(order_address).to be_invalid
      end

      it '記号を含む場合は無効であること' do
        order_address = FactoryBot.build(:order_address, building_name: 'Example!Building')
        expect(order_address).to be_invalid
      end
  
      it '日本語文字を含む場合は無効であること' do
        order_address = FactoryBot.build(:order_address, building_name: '建物名')
        expect(order_address).to be_invalid
      end
    end
  end
end
