require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '購入情報の保存' do
    context '保存できる場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end

      it '建物名が空でも保存できること' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
    end

    context '保存できない場合' do
      it '郵便番号が空では保存できないこと' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が正しい形式でないと保存できないこと' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end

      it '都道府県が未選択（id:1）では保存できないこと' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では保存できないこと' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では保存できないこと' do
        @order_form.house_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空では保存できないこと' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が9桁以下では保存できないこと' do
        @order_form.phone_number = '090123456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is too short')
      end

      it '電話番号が半角数字以外では保存できないこと' do
        @order_form.phone_number = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid. Input only number')
      end

      it 'user_idが空では保存できないこと' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では保存できないこと' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end

      it 'トークンが空では保存できないこと' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
