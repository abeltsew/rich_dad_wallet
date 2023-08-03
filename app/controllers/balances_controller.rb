class BalancesController < ApplicationController
  before_action :authenticate_user!
  def index
    @balances = Balance.where(author_id: current_user.id).order('created_at DESC')
  end

  def new
    @balance = Balance.new
  end

  def show
    if current_user.id.to_i == Balance.find(params[:id]).author_id.to_i
      @balance = Balance.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def create
    @balance = Balance.new(balance_params)
    @balance.author = current_user
    if @balance.save
      redirect_to root_path, notice: 'Balance was successfully created'
    else
      render :new, status: :unprocessable_entity, notice: 'An error has occurred while creating'
    end
  end

  private

  def balance_params
    params.require(:balance).permit(:name, :icon)
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to home_path
    end
  end
end
