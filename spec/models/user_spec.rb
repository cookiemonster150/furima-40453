require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "first_nameとlast_name,first_name_kanaとlast_name_kana,nickname,,email、passwordとpassword_confirmationが存在すれば登録できる" do
        @user = FactoryBot.build(:user,
                            first_name: '田中',
                            last_name: '颯透',
                            first_name_kana: 'タナカ',
                            last_name_kana: 'ハヤト',
                            nickname: 'name',
                            email: 'sample@sample',
                            password: '66666a',
                            password_confirmation: '66666a')
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "first_nameが空では登録できない" do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "date_of_birthが空では登録できない" do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

        it "passwordが空では登録できない" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
         another_user = FactoryBot.build(:user)
         another_user.email = @user.email
         another_user.valid?
         expect(another_user.errors.full_messages).to include('Email has already been taken')
       end

      it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      
      it 'passwordとpassword_confirmationが不一致では登録できない' do
       @user.password = '123456'
       @user.password_confirmation = '1234567'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include( "Password is invalid")
       end
      
      it 'passwordが半角英字のみの場合は登録できない' do
        @user = FactoryBot.build(:user, password: 'password', password_confirmation: 'password')
        @user.valid?
        expect(@user.errors[:password]).to include("is invalid")
      end
      
      it 'passwordが全角の場合は登録できない' do
        @user = FactoryBot.build(:user, password: 'パスワード', password_confirmation: 'パスワード')
        @user.valid?
        expect(@user.errors[:password]).to include( "is invalid")
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user = FactoryBot.build(:user, last_name: 'Smith')
        @user.valid?
        expect(@user.errors[:last_name]).to include("is invalid")
      end
    
      it '名（全角）に半角文字が含まれていると登録できない' do
        @user = FactoryBot.build(:user, first_name: 'John')
        @user.valid?
        expect(@user.errors[:first_name]).to include("is invalid")
      end
    
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user = FactoryBot.build(:user, last_name_kana: '山田')
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include("is invalid")
      end
    
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user = FactoryBot.build(:user, first_name_kana: '太郎')
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include("is invalid")
      end
    end
 end
end