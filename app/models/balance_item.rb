class BalanceItem < ApplicationRecord
  belongs_to :item
  belongs_to :balance

  after_save :update_balance_total_amount

  private

  def update_balance_total_amount
    balance.total_amount = balance.total_amount + item.amount
    balance.save
  end
end
