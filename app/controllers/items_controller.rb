class ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    @item.author = current_user

    if save_item_and_balance_item
      redirect_to balance_path(params[:balance_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def save_item_and_balance_item
    ActiveRecord::Base.transaction do
      @item.save
      BalanceItem.create(item: @item, balance_id: params[:balance_id])
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

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
