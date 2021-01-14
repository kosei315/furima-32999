require 'rails_helper'

RSpec.describe Item ,type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいかないとき' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が必須であること' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Product name can't be blank"
      end
      it '商品の説明が必須であること' do
        @item.product_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Product description can't be blank"
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category is not a number"
      end
      it '商品の状態についての情報が必須であること' do
        @item.product_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Product condition is not a number"
      end
      it '配送料の負担についての情報が必須であること' do
        @item.shipping_charges_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charges is not a number"
      end
      it '発送元の地域についての情報が必須であること' do
        @item.delivery_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery area is not a number"
      end
      it '発送までの日数についての情報が必須であること' do
        @item.data_of_shipment_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Data of shipment is not a number"
      end
      it '価格についての情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格の範囲が、¥300~¥9999999の間であること' do
        @item.price = "330"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 333"
      end
      it '価格の範囲が、¥300~¥9999999の間であること' do
        @item.price = "99999990"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = "１Aa#"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
    end
  end
end
