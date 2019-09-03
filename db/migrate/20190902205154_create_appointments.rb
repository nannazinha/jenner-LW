class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.date :date
      t.string :status
      t.integer :price
      t.references :laboratory, foreign_key: true
      t.references :vaccine, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
