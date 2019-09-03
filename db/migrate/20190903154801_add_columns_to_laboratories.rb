class AddColumnsToLaboratories < ActiveRecord::Migration[5.2]
  def change
    add_column :laboratories, :opening_time, :time
    add_column :laboratories, :closing_time, :time
  end
end
