require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item_info)
    @order_purchase = FactoryBot.build(:order_purchase, user_id: user.id, item_id: item.id)
    sleep 0.05
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it '全ての情報が正しく存在すれば登録できる' do
        expect(@order_purchase).to be_valid
      end
      it '建物名がなくても登録できる' do
        @order_purchase.building = ' '
        expect(@order_purchase).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'postal_codeがなければ出品できない' do
        @order_purchase.postal_code = ' '
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが3桁ハイフン4桁でなければ出品できない' do
        @order_purchase.postal_code = '1234567'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeが半角文字列でなければ出品できない' do
        @order_purchase.postal_code = '１２３−４５６７'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_from_idが未選択だと出品できない' do
        @order_purchase.prefecture_from_id = 1
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Prefecture from can't be blank")
      end
      it 'cityがなければ出品できない' do
        @order_purchase.city = ' '
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesがなければ出品できない' do
        @order_purchase.addresses = ' '
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberがなければ出品できない' do
        @order_purchase.phone_number = ' '
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid.')
      end
      it 'phone_numberが半角数字でなければ出品できない' do
        @order_purchase.phone_number = '０９０１２３４５６７８'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが半角数字の10文字以上11文字以下でなければ出品できない' do
        @order_purchase.phone_number = '1234'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Phone number is invalid.')
      end
      it 'phone_numberが半角数字の12文字以上の場合は出品できない' do
        @order_purchase.phone_number = '090123456789'
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'token（クレジットカード情報）がなければ出品できない' do
        @order_purchase.token = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idがなければ出品できない' do
        @order_purchase.user_id = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'item_info_idがなければ出品できない' do
        @order_purchase.item_id = nil
        @order_purchase.valid?
        expect(@order_purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
