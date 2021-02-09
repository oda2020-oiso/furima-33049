require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do

    context '内容に問題がない場合' do
      it '全ての情報が適切である場合登録できる' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複するemailでは登録できない' do
        @user.email = 'hoge@fuga.com'
        @user.save
        user2 = FactoryBot.create(:user)
        user2.email = 'hoge@fuga.com'
        user2.valid?
        expect(user2.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'hogefuga'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字以下では登録できない' do
        @user.password = '1a2b3'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが数字のみだと登録できない' do
        @user.password = '115511'
        @user.password_confirmation = '115511'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて半角のみで設定してください")
      end

      it 'passwordが英字のみだと登録できない' do
        @user.password = 'tccoda'
        @user.password_confirmation = 'tccoda'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて半角のみで設定してください")
      end

      it 'passwordは確認も含めて２回入力しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordと確認用passwordが一致していないと登録できない' do
        @user.password = 'k1t23r'
        @user.password_confirmation = 'o9d8a7'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'password：全角英数混合は登録できない' do
        @user.password = 'krｋｒ898'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて半角のみで設定してください")

      end

      it '誕生日：空の場合は登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it '姓：空の場合は登録できない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it '姓：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
        @user.family_name = 'brown'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
      end

      it '名：空の場合は登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '名：全角（漢字・ひらがな・カタカナ）以外は登録できない' do
        @user.first_name = 'brouwn'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end

      it '姓（フリガナ）：空の場合は登録できない' do
        @user.family_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana can't be blank")

      end

      it '姓（フリガナ）：全角（カタカナ）以外は登録できない' do
        @user.family_kana = 'brown'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana is invalid. Input full-width katakana characters.")
      end

      it '名（フリガナ）：空の場合は登録できない' do
        @user.first_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end

      it '名（フリガナ）：全角（カタカナ）以外は登録できない' do
        @user.first_kana = 'ken'
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana is invalid. Input full-width katakana characters.")
      end
      
    end
  end
end
