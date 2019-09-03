class AddCoordinatesToLaboratory < ActiveRecord::Migration[5.2]
  def change
    add_column :laboratories, :latitude, :float
    add_column :laboratories, :longitude, :float
  end
end
