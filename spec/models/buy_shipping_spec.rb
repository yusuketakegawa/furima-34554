require 'rails_helper'

RSpec.describe BuyShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy_shipping = FactoryBot.build(:buy_shipping, user_id: user.id, item_id: item.id)
    sleep(0.5)
  end
  context '商品購入が出来る時' do
    it '全ての値が正しく入力されていれば登録できる' do
      expect(@buy_shipping).to be_valid
    end
    it 'building_nameが空でも登録できる' do
      @buy_shipping.building = ''
      expect(@buy_shipping).to be_valid
    end
  end
  context '商品購入が出来ない時' do
    it 'postal_codeが空だと登録できない' do
      @buy_shipping.postal_code = ''
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと登録できない' do
      @buy_shipping.postal_code = '1_234_566'
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include('Postal code is invalid')
    end
    it 'prefecture_idを選択していないと登録できない' do
      @buy_shipping.prefecture_id = ''
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが1のとき登録できない' do
      @buy_shipping.prefecture_id = 1
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'addressが空だと登録できない' do
      @buy_shipping.address = ''
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include("Address can't be blank")
    end
    it 'municipalityが空だと登録できない' do
      @buy_shipping.municipality = ''
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'phone_numberが空だと登録できない' do
      @buy_shipping.phone_number = ''
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numerが12以上だと登録できない' do
      @buy_shipping.phone_number = '123_456_789_012'
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberに-等がついていると登録できない' do
      @buy_shipping.phone_number = '1234 - 6_789_012'
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberが英数字混同では登録できない' do
      @buy_shipping.phone_number = '3245a673222'
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include('Phone number is invalid')
    end
    it 'tokenが空だと登録できない' do
      @buy_shipping.token = nil
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空だと登録できない' do
      @buy_shipping.user_id = ''
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと登録できない' do
      @buy_shipping.item_id = ''
      @buy_shipping.valid?
      expect(@buy_shipping.errors.full_messages).to include("Item can't be blank")
    end

  end
end
