require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end
  describe '購入情報の保存' do
   context '内容に問題ない場合' do
     it 'すべての値が正しく入力されていれば保存できること' do
       expect(@order_address).to be_valid
     end

     it 'building_nameは空でも保存できること' do
       @order_address.building_name = ''
       expect(@order_address).to be_valid
     end
   end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_codeが「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order_address.postal_code = '12-3456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefecture_idにid_1を入力した状態では保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @order_address.city= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank", "City is invalid")
      end

      it 'cityに日本語以外があると保存できないこと' do
        @order_address.city= 'a'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City is invalid")
      end

      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank", "House number is invalid")
      end

      it 'house_numberに平仮名・漢字・カタカナが含まれていると登録できない' do
        @order_address.house_number= 'ひらがな'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number is invalid")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it 'phone_numberは12桁以上の半角数値は保存できないこと' do
        @order_address.phone_number = '080-1234-56789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは9桁以内の半角数値は保存できないこと' do
        @order_address.phone_number = '080-1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'tokenが空だと保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end