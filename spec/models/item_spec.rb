require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
  end
  describe '出品商品登録' do
    context '出品商品が登録できる場合' do
      it 'user_id,product_name、explanation、category_id、condition_id、shipping_fee_id、sender_address_id、shipping_date_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品商品が登録できない場合' do
      it 'product_nameが空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'product_nameが41文字以上では登録できない' do
        @item.product_name = "a" * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Product name is too long (maximum is 40 characters)')
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'explanationが1001文字以上では登録できない' do
        @item.explanation = "a" * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Explanation is too long (maximum is 1000 characters)')
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it 'shipping_fee_idが空では登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee is not a number")
      end
      it 'sender_address_idが空では登録できない' do
        @item.sender_address_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender address is not a number")
      end
      it 'shipping_date_idが空では登録できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date is not a number")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number", "Price 半角数字のみ入力できます")
      end
      it 'priceが299円以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10000000円以上では登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end