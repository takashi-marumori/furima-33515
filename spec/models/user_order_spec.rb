require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @user_order = FactoryBot.build(:user_order, user_id: @user, item_id: @item)
    sleep 0.1
  end

  describe '商品の購入' do
    context '購入できる時' do
      it 'postal_code,prefecture_id,municipality,address,building_name,phone_number,tokenがあれば購入できる' do
        expect(@user_order).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @user_order.building_name = nil
        expect(@user_order).to be_valid
      end
      it 'phone_numberが10桁だと購入できる' do
        @user_order.phone_number = '1111111111'
        expect(@user_order).to be_valid
      end
      it 'phone_numberが11桁だと購入できる' do
        @user_order.phone_number = '11111111111'
        expect(@user_order).to be_valid
      end

      context '購入できない時' do
        it 'postal_codeが空だと購入できない' do
          @user_order.postal_code = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeが(三文字)(ハイフン)(四文字)でないと購入できない' do
          @user_order.postal_code = '11-11111'
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include('Postal code is invalid')
        end
        it 'postal_codeがハイフンがないと購入できない' do
          @user_order.postal_code = '1111111'
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include('Postal code is invalid')
        end
        it 'prefecture_idが空だと購入できない' do
          @user_order.prefecture_id = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include('Prefecture is not a number')
        end
        it 'prefecture_idが1だと購入できない' do
          @user_order.prefecture_id = 1
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include('Prefecture must be other than 1')
        end
        it 'municipalityが空だと購入できない' do
          @user_order.municipality = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
        end
        it 'addressが空だと購入できない' do
          @user_order.address = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Address can't be blank")
        end
        it 'tokenが空だと購入できない' do
          @user_order.token = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Token can't be blank")
        end
        it 'phone_numberが空だと購入できない' do
          @user_order.phone_number = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberが12桁以上だと購入できない' do
          @user_order.phone_number = '000000000000'
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include('Phone number is invalid')
        end
        it 'phone_numberが9桁以下だと購入できない' do
          @user_order.phone_number = '000000000'
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include('Phone number is invalid')
        end
        it 'phone_numberが英数字混合だと購入できない' do
          @user_order.phone_number = 'aaaa0000'
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include('Phone number is invalid')
        end
        it 'user_idが空だと購入できない' do
          @user_order.user_id = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空だと購入できない' do
          @user_order.item_id = nil
          @user_order.valid?
          expect(@user_order.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
end
