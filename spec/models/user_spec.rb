require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "ニックネームが必須であること" do
      @user.name = ""
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end
    it "メールアドレスが必須であること" do
      @user.email = ""
      @user.valid?
      #binding.pry
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "メールアドレスが一意性であること" do
      @user.save
      @another_user = FactoryBot.build(:user)
      @another_user.email = @user.email
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include("Email has already been taken")

    end
    it "メールアドレスは、@を含む必要があること" do
      @user.email ="aaacom"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが必須であること" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = "aaaA1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは、半角英数字混合での入力が必須であること" do
      @user.password = "aaaaAAAA"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it "パスワードは、確認用を含めて2回入力すること" do
      @user.save
      @user.password ="aaaa33aA"
      @user.password_confirmation =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      @user.save
      @user.password ="aaaa3A"
      @user.password_confirmation = "aast3A"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "全角では登録できないこと" do
      @user.password = "ああああああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it "数字のみでは登録できないこと" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it "英語のみでは登録できないこと" do
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
  end

  describe "新規登録/本人情報確認" do
    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.full_width_last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Full width last name can't be blank")
    end
    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      @user.full_width_first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Full width first name can't be blank")
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.full_width_last_name = "AAAAAaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Full width last name is invalid")
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.full_width_first_name = "3Aaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Full width first name is invalid")
    end
    it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user.kana_last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name can't be blank")
    end
    it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      @user.kana_first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end
    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.kana_first_name = "aa21嗚呼あ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name is invalid")
    end
    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.kana_last_name = "aa21嗚呼あ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name is invalid")
    end
    it "生年月日が必須であること" do
      @user.birthday =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
