class BalanceController < ApplicationController
  before_action :authenticate_user!
  def index
    @balances = Balance.all
  end

  private

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to home_path
    end
  end
end
