class RecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @record = FormRecord.new
  end

  def create
    @item = Item.find(params[:item_id])
  end

end
