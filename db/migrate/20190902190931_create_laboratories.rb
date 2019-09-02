class CreateLaboratories < ActiveRecord::Migration[5.2]
  def change
    create_table :laboratories do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :opening_hours
      t.string :website
      t.string :category

      t.timestamps
    end
  end
end
