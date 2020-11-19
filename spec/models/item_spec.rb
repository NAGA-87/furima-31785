require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '商品画像が空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空だと登録できない' do
      @item.title = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it '商品の説明が空だと登録できない' do
      @item.explain = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explain can't be blank")
    end
    it 'カテゴリーの情報が空だと登録できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category status Select')
    end
    it '商品の状態が空だと登録できない' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition status Select')
    end
    it '配送料の負担が空だと登録できない' do
      @item.fee_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Fee status Select')
    end
    it '発送元の地域が空だと登録できない' do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture status Select')
    end
    it '発送までの日数が空だと登録できない' do
      @item.days_to_delivery_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to delivery status Select')
    end
    it '価格が空だと登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が¥9999999を超えると登録できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it '価格が¥300より低いと登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it '価格は半角数字以外登録できない' do
      @item.price = '１００００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end
    it '入力必須項目が存在すれば登録できること' do
      expect(@item).to be_valid
    end
  end
end
