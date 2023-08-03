class ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    @item.author = current_user

    if @item.save
      BalanceItem.create(item: @item, balance_id: params[:balance_id])
      redirect_to "/balances/#{params[:id]}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :amount)
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to home_path
    end
  end
end
