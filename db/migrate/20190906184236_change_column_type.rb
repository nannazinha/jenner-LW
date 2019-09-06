class ChangeColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :appointments, :date, :datetime
  end
end
