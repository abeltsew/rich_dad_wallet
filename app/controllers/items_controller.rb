class ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user.id.to_i == Balance.find(params[:balance_id]).author_id.to_i
      @item = Item.new
      @balances = Balance.where(author_id: current_user.id)
    else
      redirect_to '/'
    end
  end

  def create
    @item = Item.new(items_params)
    @item.author_id = current_user.id

    if params[:item][:selected_ids]
      if save_item_and_balance_item
        redirect_to balance_path(params[:balance_id])
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to balance_items_path(params[:balance_id]), alert: 'please select at least one checkbox.'
    end
  end

  private

  def save_item_and_balance_item
    ActiveRecord::Base.transaction do
      @item.save
      params[:item][:selected_ids].each do |id|
        BalanceItem.create(item_id: @item.id, balance_id: id.to_i)
      end
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  def items_params
    params.require(:item).permit(:name, :amount)
  end

  def selection_params
    params.require(:item).permit(:selected_ids)
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to home_path
    end
  end
end
