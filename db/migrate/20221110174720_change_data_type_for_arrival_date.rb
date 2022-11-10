class ChangeDataTypeForArrivalDate < ActiveRecord::Migration[6.0]
  def change
    change_column :deliveries, :arrival_date, :date
  end
end
