class CreateVaccines < ActiveRecord::Migration[5.2]
  def change
    create_table :vaccines do |t|
      t.string :name
      t.integer :vaccination_age
      t.integer :doses
      t.boolean :lab
      t.boolean :sus
      t.boolean :required
      t.text :description

      t.timestamps
    end
  end
end
