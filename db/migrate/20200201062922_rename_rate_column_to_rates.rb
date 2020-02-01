class RenameRateColumnToRates < ActiveRecord::Migration[5.2]
  def change
    rename_column :rates, :rate, :ratenum
  end
end
