require 'rails_helper'

RSpec.describe OrderDistribution, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_distribution = FactoryBot.build(:order_distribution)
    @order_distribution.user_id = @user.id
    @order_distribution.item_id = @item.id
    sleep 0.1
  end

  describe '商品購入機能' do
    context '正常に購入が完了する場合' do
      it '全てのフォームが適切に入力されている場合' do
        expect(@order_distribution).to be_valid
      end

      it '住所が空欄でも登録ができる' do
        @order_distribution.building_name = ''
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
        expect(@order_distribution.errors.full_messages).to include('Postal code is invalid')
      end

      it '郵便番号が空欄の場合' do
        @order_distribution.postal_code = ''
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が全角の場合' do
        @order_distribution.postal_code = '１２３４５６７'
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include('Postal code is invalid')
      end

      it '郵便番号が短い場合' do
        @order_distribution.postal_code = '1232'
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include('Postal code is invalid')
      end

      it '郵便番号がアルファベットの場合' do
        @order_distribution.postal_code = 'asewqsd'
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県が選択されていない場合' do
        @order_distribution.prefecture_id = 1
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include('Prefecture must be other than 1')
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

      it '電話番号が全角数字の場合' do
        @order_distribution.phone_number = '０９０１２３４５６７８'
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号の桁数が多い場合' do
        @order_distribution.phone_number = '098765432123456789'
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号は英数字混合では登録できない' do
        @order_distribution.phone_number = '090ab78re24'
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include('Phone number is invalid')
      end

      it 'user_idが空だと登録できない' do
        @order_distribution.user_id = nil
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと登録できない' do
        @order_distribution.item_id = nil
        @order_distribution.valid?
        expect(@order_distribution.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
