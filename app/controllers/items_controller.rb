class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :user_birthday).merge(user_id: current_user.id)
  end
end
