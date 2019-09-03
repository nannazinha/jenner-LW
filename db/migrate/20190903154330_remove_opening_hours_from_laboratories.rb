class RemoveOpeningHoursFromLaboratories < ActiveRecord::Migration[5.2]
  def change
    remove_column :laboratories, :opening_hours, :string
  end
end
