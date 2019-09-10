class AddImageToVaccines < ActiveRecord::Migration[5.2]
  def change
    add_column :vaccines, :image, :string
  end
end
