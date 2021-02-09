require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    it '全ての情報が適切である場合登録できる' do
      expect(@user).to be_valid
    end

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
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it 'passwordが英字のみだと登録できない' do
      @user.password = 'tccoda'
      @user.password_confirmation = 'tccoda'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
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
  end
end
