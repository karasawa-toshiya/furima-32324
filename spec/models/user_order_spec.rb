require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @user_order = FactoryBot.build(:user_order, user_id: user.id, item_id: item.id)
    sleep 0.5
  end

  describe '商品購入機能' do
    context '商品購入できる時' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@user_order).to be_valid
      end

      it 'building_nameは空でも購入できること' do
        @user_order.building_name = ''
        expect(@user_order).to be_valid
      end
    end

    context '商品購入できない時' do
      it 'tokenが空では登録できないこと' do
        @user_order.token = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと購入できないこと' do
        @user_order.postal_code = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @user_order.postal_code = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'shipping_area_idを選択していないと購入できないこと' do
        @user_order.shipping_area_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Shipping area can't be blank")
      end

      it 'cityは空だと購入できないこと' do
        @user_order.city = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end

      it 'addressは空だと購入できないこと' do
        @user_order.address = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberは空だと購入できないこと' do
        @user_order.phone_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）' do
        @user_order.phone_number = '090123456789'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number Input only number and Within 11 digits")
      end

      it 'user_idは空だと購入できないこと' do
        @user_order.user_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idは空だと購入できないこと' do
        @user_order.item_id = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
