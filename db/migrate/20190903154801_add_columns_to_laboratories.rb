class AddColumnsToLaboratories < ActiveRecord::Migration[5.2]
  def change
    add_column :laboratories, :opening_time, :integer
    add_column :laboratories, :closing_time, :integer
  end
end
