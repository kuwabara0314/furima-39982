require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameに全角漢字、ひらがな、カタカナ以外が含まれていると登録できない' do
        invalid_last_names = ['山田111','Yamada','ﾔﾏﾀﾞ']
        invalid_last_names.each do |invalid_last_name|
          @user.last_name = invalid_last_name
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
        end
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameに全角漢字、ひらがな、カタカナ以外が含まれていると登録できない' do
        invalid_first_names = ['山田111','Yamada','ﾔﾏﾀﾞ']
        invalid_first_names.each do |invalid_first_name|
          @user.first_name = invalid_first_name
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
        end
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaに半角カタカナ以外が含まれていると登録できない' do
        invalid_last_name_kanas = ['ﾔﾏﾀﾞ', 'ﾔﾏﾀﾞ111', '山田']
        invalid_last_name_kanas.each do |invalid_last_name_kana|
          @user.last_name_kana = invalid_last_name_kana
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
        end
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaに半角カタカナ以外が含まれていると登録できない' do
        invalid_first_name_kanas = ['ﾔﾏﾀﾞ', 'ﾔﾏﾀﾞ111', '山田']
        invalid_first_name_kanas.each do |invalid_first_name_kana|
          @user.first_name_kana = invalid_first_name_kana
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
        end
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordは英字のみでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
      it 'passwordは全角では登録できない' do
        @user.password = 'ａ０００００'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end
    end
  end
end
