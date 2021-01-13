require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nickname,email,password,password_confirmation,first_name,last_name,read_first_name,read_last_name,dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが英数字6文字以上であれば登録できる' do
        @user.password = '1aaaaa'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
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
      it 'emailに＠がないと登録できない' do
        @user.email = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'read_last_nameが空では登録できない' do
        @user.read_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Read last name is invalid')
      end
      it 'read_first_nameが空では登録できない' do
        @user.read_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Read first name is invalid')
      end
      it 'dateが空では登録できない' do
        @user.date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが英数字5文字以下では登録できない' do
        @user.password = '11aaa'
        @user.password = '11aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      context 'last_name,first_nameは、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        it 'last_nameは、英字では登録できない' do
          @user.last_name = 'A'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name is invalid')
        end
        it 'first_nameは、英字では登録できない' do
          @user.first_name = 'A'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid')
        end
      end

      context 'read_last_name,read_first_nameは、全角（カタカナ）でないと登録できない' do
        it 'read_last_nameは、全角（漢字）では登録できない' do
          @user.read_last_name = '田中'
          @user.valid?
          expect(@user.errors.full_messages).to include('Read last name is invalid')
        end
        it 'read_last_nameは、全角（ひらがな）では登録できない' do
          @user.read_last_name = 'たなか'
          @user.valid?
          expect(@user.errors.full_messages).to include('Read last name is invalid')
        end
        it 'read_last_nameは、英字では登録できない' do
          @user.read_last_name = 'Tanaka'
          @user.valid?
          expect(@user.errors.full_messages).to include('Read last name is invalid')
        end
        it 'read_first_nameは、全角（漢字）では登録できない' do
          @user.read_first_name = '太郎'
          @user.valid?
          expect(@user.errors.full_messages).to include('Read first name is invalid')
        end
        it 'read_first_nameは、全角（ひらがな）では登録できない' do
          @user.read_first_name = 'たろう'
          @user.valid?
          expect(@user.errors.full_messages).to include('Read first name is invalid')
        end
        it 'read_first_nameは、英字では登録できない' do
          @user.read_first_name = 'Taro'
          @user.valid?
          expect(@user.errors.full_messages).to include('Read first name is invalid')
        end
      end

      context 'passwordが英数字が両方存在しないと登録できない' do
        it '数字のみのパスワードでは登録できない' do
          @user.password = '111111'
          @user.password = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it '英字のみのパスワードでは登録できない' do
          @user.password = 'aaaaaa'
          @user.password = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
    end
  end
end
