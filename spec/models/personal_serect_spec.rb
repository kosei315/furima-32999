require 'rails_helper'

RSpec.describe PersonalSerect, type: :model do
  before do
    @personal_serect = FactoryBot.build(:personal_serect)
  end
  describe "商品購入機能" do
    context '商品購入がうまく行く時' do
    it "必要な情報を適切に入力すると、商品の購入ができること" do
      expect(@personal_serect).to be_valid
    end
    it"建物名がなくても商品の購入ができる"do
      @personal_serect.building_name = nil
      expect(@personal_serect).to be_valid
      end
  end
  context '商品購入がうまくいかない時' do
    it "tokenがなければ保存ができないこと" do
      @personal_serect.token = nil
      @personal_serect.valid?
      expect(@personal_serect.errors.full_messages).to include "Token can't be blank"
    end
    it "配送先の情報として、郵便番号が必須であること" do
      @personal_serect.postal_code = nil
      @personal_serect.valid?
      expect(@personal_serect.errors.full_messages).to include "Postal code can't be blank"
    end
    it "配送先の情報として、都道府県が必須であること" do
      @personal_serect.delivery_area_id = "1"
      @personal_serect.valid?
      expect(@personal_serect.errors.full_messages).to include "Delivery area must be other than 1"
    end
    it "配送先の情報として、市区町村が必須であること" do
      @personal_serect.municipality = nil
      @personal_serect.valid?
      expect(@personal_serect.errors.full_messages).to include "Municipality can't be blank"
    end
    it "配送先の情報として、番地が必須であること" do
      @personal_serect.address = nil
      @personal_serect.valid?
      expect(@personal_serect.errors.full_messages).to include "Address can't be blank"
    end
    it "配送先の情報として、電話番号が必須であること" do
      @personal_serect.phone_number = nil
      @personal_serect.valid?
      expect(@personal_serect.errors.full_messages).to include "Phone number can't be blank"
    end
    it "郵便番号にはハイフンが必要であること（123-4567となる）" do
      @personal_serect.postal_code = "1111111"
      @personal_serect.valid?
      expect(@personal_serect.errors.full_messages).to include "Postal code is invalid"
    end
    it "電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）" do
      @personal_serect.phone_number = "080-9999-1111"
      @personal_serect.valid?
      expect(@personal_serect.errors.full_messages).to include "Phone number is invalid"
    end
  end
end
end