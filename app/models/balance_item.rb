class BalanceItem < ApplicationRecord
  belongs_to :item
  belongs_to :balance
  has_many :balances, dependent: :destroy
  has_many :items, dependent: :destroy
end
