class AddTotalAmountToBalances < ActiveRecord::Migration[7.0]
  def change
    add_column :balances, :total_amount, :float, default: 0
  end
end
