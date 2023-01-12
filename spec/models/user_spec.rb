require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "必要項目全てに値が存在すれば登録できる" do
        expect(@user).to be_valid
      end
     end
    context "新規登録できないとき" do      
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it "birth_dateが空だと登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email:@user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it "emailは@を含まないと登録できない" do
        @user.email = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "ab123"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passwordとpassword_confirmationが不一致だと登録できない" do
        @user.password = 111111
        @user.password_confirmation = 222222
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "passwordが全角だと登録できない" do
        @user.password ='ABCD１２３４'
        @user.password_confirmation = 'ABCD１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid", "Password confirmation is invalid"
      end
      it "passwordが数字だけだと登録できない" do
        @user.password ='111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid", "Password confirmation is invalid"
      end
      it "passwordが英字だけだと登録できない" do
        @user.password ='abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid", "Password confirmation is invalid"
      end
      it "first_nameが半角では登録できない" do
        @user.first_name = 'ｱｲｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it "last_nameが半角では登録できない" do
        @user.last_name = 'ｱｲｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end  
      it "first_name_kanaが半角では登録できない" do
        @user.first_name_kana = 'ｱｲｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
      it "last_name_kanaが半角では登録できない" do
        @user.last_name_kana = 'ｱｲｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid"
      end
    end
  end
end
