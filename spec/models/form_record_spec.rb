require 'rails_helper'

RSpec.describe FormRecord, type: :model do
  describe '#create' do
    before do
      @record = FactoryBot.build(:form_record)
    end

    describe '購入機能' do
      context '購入が成功した時' do
        it '入力必須項目が存在すれば登録できる' do
          expect(@record).to be_valid
        end

        it 'building_nameは空でも良い' do
          @record.building_name = ''
          expect(@record).to be_valid
        end
      end

      context '購入に失敗した時' do
        it 'tokenが空だと登録できない' do
          @record.token = nil
          @record.valid?
          expect(@record.errors.full_messages).to include("Token can't be blank")
        end

        it '配送先の郵便番号が空だと登録できない' do
          @record.postal_code = nil
          @record.valid?
          expect(@record.errors.full_messages).to include("Postal code can't be blank")
        end

        it '配送先の郵便番号はハイフンがないと登録できない' do
          @record.postal_code = '12345678'
          @record.valid?
          expect(@record.errors.full_messages).to include("Postal code Input correctly")
        end

        it '配送先の都道府県情報が１だと登録できない' do
          @record.prefecture_id = '1'
          @record.valid?
          expect(@record.errors.full_messages).to include('Prefecture status Select')
        end

        it '配送先の市区町村が空だと登録できない' do
          @record.municipality = nil
          @record.valid?
          expect(@record.errors.full_messages).to include("Municipality can't be blank")
        end

        it '配送先の番地が空だと登録できない' do
          @record.house_number = nil
          @record.valid?
          expect(@record.errors.full_messages).to include("House number can't be blank")
        end

        it '配送先の電話番号が空だと登録できない' do
          @record.phone_number = nil
          @record.valid?
          expect(@record.errors.full_messages).to include("Phone number can't be blank")
        end

        it '電話番号はハイフンなしで11桁以内でなければ登録できない' do
          @record.phone_number = "090-1234-5678"
          @record.valid?
          expect(@record.errors.full_messages).to include("Phone number Input only number")
        end

      end
    end

  end
end
