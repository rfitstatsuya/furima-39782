require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題なく購入できる場合' do
      it 'すべての値が正しく入力されている' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題があり購入できない場合' do
      it 'post_codeが空である' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式ではない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'post_codeが半角の文字列ではない' do
        @order_address.post_code = '１２３ー４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'prefectureが---を選択している' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空である' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空である' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberが空である' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが10桁未満である' do
        @order_address.telephone_number = '000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが12桁以上である' do
        @order_address.telephone_number = '000000000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'telephone_numberが半角の文字列ではない' do
        @order_address.telephone_number = '０９０００００００００'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'クレジットカードの情報が空である' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
