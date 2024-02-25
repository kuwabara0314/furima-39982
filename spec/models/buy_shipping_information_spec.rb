require 'rails_helper'

RSpec.describe BuyShippingInformation, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_shipping_information = FactoryBot.build(:buy_shipping_information, user_id: user.id, item_id: item.id)
    sleep 1
  end

  describe '購入者情報の保存' do

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@buy_shipping_information).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @buy_shipping_information.building = ''
        expect(@buy_shipping_information).to be_valid
      end
    end

    context '内容に問題がある場合' do 
      it 'postcodeが空では保存できない' do
        @buy_shipping_information.postcode = ''
        @buy_shipping_information.valid?
        expect(@buy_shipping_information.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフン含む形式でないと保存できない' do
        @buy_shipping_information.postcode = '1234567'
        @buy_shipping_information.valid?
        expect(@buy_shipping_information.errors.full_messages).to include("Postcode is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idが選択されてないと保存できない' do
        @buy_shipping_information.prefecture_id = '1'
        @buy_shipping_information.valid?
        expect(@buy_shipping_information.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空では保存できない' do
        @buy_shipping_information.municipalities = ''
        @buy_shipping_information.valid?
        expect(@buy_shipping_information.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'blockが空では保存できない' do
        @buy_shipping_information.block = ''
        @buy_shipping_information.valid?
        expect(@buy_shipping_information.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @buy_shipping_information.phone_number = ''
        @buy_shipping_information.valid?
        expect(@buy_shipping_information.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上11桁以内でないと保存できない' do
        @buy_shipping_information.phone_number = '123456'
        @buy_shipping_information.valid?
        expect(@buy_shipping_information.errors.full_messages).to include("Phone number is too short or too long")
      end
      it 'phone_numberが10桁以上11桁以内でないと保存できない' do
        @buy_shipping_information.phone_number = '123456789012'
        @buy_shipping_information.valid?
        expect(@buy_shipping_information.errors.full_messages).to include("Phone number is too short or too long")
      end
      it 'phone_number半角数字でないと保存できない' do
        @buy_shipping_information.phone_number = '０９０１２３４５６７８'
        @buy_shipping_information.valid?
        expect(@buy_shipping_information.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'ユーザーが紐づいていないと保存できない' do
        @buy_shipping_information.user_id = nil
        @buy_shipping_information.valid?
        expect(@buy_shipping_information.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていないと保存できない' do
        @buy_shipping_information.item_id = nil
        @buy_shipping_information.valid?
        expect(@buy_shipping_information.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できない" do
        @buy_shipping_information.token = nil
        @buy_shipping_information.valid?
        expect(@buy_shipping_information.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end