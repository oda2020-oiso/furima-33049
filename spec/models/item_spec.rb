require 'rails_helper'


RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品機能' do
    context '商品登録が成功する場合' do
      it '全ての情報が入力されている' do
        expect(@item).to be_valid
      end
    end

    context '商品出品が失敗する場合' do
      it '画像がついていない場合' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '名称が空欄の場合' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空欄の場合' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリ情報が未選択の場合' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品状態が未選択の場合' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")

      end

      it '配送料負担の情報が未選択の場合' do
        @item.carriage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Carriage must be other than 1")
      end

      it '発送元地域の情報が未選択の場合' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '発送までの日数が未選択の場合' do
        @item.schedule_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule must be other than 1")

      end

      it '価格情報が空欄の場合' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300円未満の場合' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end

      it '価格が9,999,999円より大きい場合' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end

      it '価格が全角数字の場合' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")

      end

      it '価格が半角英字の場合' do
        @item.price = 'absc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")

      end

    end
  end
end
