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
      end

      it '名称が空欄の場合' do
      end

      it '商品説明が空欄の場合' do
      end

      it 'カテゴリ情報が未選択の場合' do
      end

      it '商品状態が未選択の場合' do
      end

      it '配送料負担の情報が未選択の場合' do
      end

      it '発送元地域の情報が未選択の場合' do
      end

      it '発送までの日数が未選択の場合' do
      end

      it '価格情報が空欄の場合' do
      end

      it '価格が300円未満の場合' do
      end

      it '価格が9,999,999円より大きい場合' do
      end

      it '価格が半角数字以外の場合' do
      end

    end
  end
end
