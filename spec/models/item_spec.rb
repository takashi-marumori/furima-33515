require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品を新規出品' do
    context '出品できる時' do
      it 'title, image, explanation, category_id, item_utatus_id, burden_id, prefecture_id, day_id, priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない時' do
      it '商品名がなければ出品できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の画像がなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品の説明がなければ出品できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報がなければ出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーの情報がid=1の場合出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態の情報がなければ出品できない' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it '商品の状態の情報がid=1の場合出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status must be other than 1')
      end
      it '配送料の負担の情報がなければ出品できない' do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it '配送料の負担の情報がid=1の場合出品できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden must be other than 1')
      end
      it '配送地域の情報がなければ出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '配送地域の情報がid=1の場合出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '配送日時の情報がなければ出品できない' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it '配送日時の情報がid=1の場合出品できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 1')
      end
      it '価格の情報がなければ出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      context '価格の範囲が、¥300~¥9,999,999の間であること' do
        it '価格が¥299以下だと登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end
        it '価格が¥10,000,000以上だと登録できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
      end
      context '価格は半角数字でなければ出品できない' do
        it '価格が全角数字だと出品できない' do
          @item.price = '３０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
        it '価格が全角漢字だと出品できない' do
          @item.price = '上'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
        it '価格が全角ひらがなだと出品できない' do
          @item.price = 'あ'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
        it '価格が全角カタカナだと出品できない' do
          @item.price = 'ア'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end
      end
    end
  end
end
