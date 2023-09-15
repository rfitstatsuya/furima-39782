require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'itemの出品' do
    context 'itemが出品できる場合' do
      it '商品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、価格を入力すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context 'itemが出品できない場合' do
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end     
      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end     
      it '商品の説明が空では出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end     
      it 'カテゴリーが---では出品できない' do
        @item.category_id = '1' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end     
      it '商品の状態が---では出品できない' do
        @item.condition_id = '1' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end     
      it '配達料の負担が---では出品できない' do
        @item.derivery_cost_id = '1' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Derivery cost can't be blank")
      end     
      it '発送元の地域が---では出品できない' do
        @item.prefecture_id = '1' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end     
      it '発送までの日数が---では出品できない' do
        @item.sending_date_id = '1' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Sending date can't be blank")
      end     
      it '価格が空では出品できない' do
        @item.price = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が全角数字を含むと出品できない' do
        @item.price = '１１１000' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格が英字では出品できない' do
        @item.price = 'aaaaa' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格が300円未満では出品できない' do
        @item.price = '299' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be in 300..9999999")
      end
      it '価格が10,000,000円以上では出品できない' do
        @item.price = '10000000' 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be in 300..9999999")
      end
    end
  end
end
