require 'rails_helper'

RSpec.describe OrderDistribution, type: :model do
  before do
    @order_distribution = FactoryBot.build(:order_distribution)
  end

  describe '商品購入機能' do
    context '正常に購入が完了する場合' do
      it '全てのフォームが適切に入力されている場合' do
        expect(@order_distribution).to be_valid
      end
    end

    context '購入に失敗する場合' do
      it 'トークンがない場合' do
        @order_distribution.token = nil
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号にハイフンが入っていない' do
        @order_distribution.postal_code = '1234567'
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号が空欄の場合' do
        @order_distribution.postal_code = ''
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が全角の場合' do
        @order_distribution.postal_code = '１２３４５６７'
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号が短い場合' do
        @order_distribution.postal_code = '1232'
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号がアルファベットの場合' do
        @order_distribution.postal_code = 'asewqsd'
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が選択されていない場合' do
        @order_distribution.prefecture_id = 1
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '市区町村が空欄の場合' do
        @order_distribution.city = ''
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include("City can't be blank")

      end

      it '番地が空欄の場合' do
        @order_distribution.address = ''
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空欄の場合' do
        @order_distribution.phone_number = ''
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号の桁数が多い場合' do
        @order_distribution.phone_number = '0987654321234567'
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include("Phone number is invalid")

      end

    end
  end
end
