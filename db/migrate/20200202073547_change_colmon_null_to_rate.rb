class ChangeColmonNullToRate < ActiveRecord::Migration[5.2]
  def change
    change_column_null :rates, :ratenum, false, 0
  end
end
