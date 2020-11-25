class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_item, only: [:index, :create]
  before_action :move_to_index_after_sold_out, only: [:index, :create]

  def index
    @record = FormRecord.new
  end

  def create
    @record = FormRecord.new(record_params)
    if @record.valid?
      pay_item
      @record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_params
    params.require(:form_record).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :token, :record_id ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: record_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_user_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index_after_sold_out
    redirect_to root_path unless @item.record == nil && current_user != @item.user
  end
end
