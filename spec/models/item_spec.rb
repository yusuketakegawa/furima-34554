require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

    describe '商品出品機能'  do
      context '出品できるとき' do
        it '全て存在していれば登録できる' do
          expect(@item).to be_valid
        end
      end
      context '出品できない時' do
        it '商品名が空だと登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品の説明が空だと登録できない' do
          @item.item_explanation= ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item explanation can't be blank")
        end
        it 'カテゴリーの情報が必須であること' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it '商品の状態が空だと登録できない' do
          @item.status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end
        it '配送料の負担についての情報が空だと登録できない' do
          @item.delivery_fee_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
        end
        it '発送元の地域についての情報が空だと登録できない' do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '発送までの日数についての情報が空だと登録できないと' do
          @item.shipping_date_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping date can't be blank")
        end
        it '販売価格についての情報が空だと登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '販売価格が299円以下の場合、保存できないこと' do
          @item.price = '100'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than 300")
        end
        it '販売価格が1000000円以上の場合、保存できないこと' do
          @item.price = '100000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than 9999999")
        end
        it '販売価格は半角数字意外だったら保存できないこと' do
          @item.price = '１１'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
      end
    end
end
