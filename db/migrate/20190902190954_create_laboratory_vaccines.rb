class CreateLaboratoryVaccines < ActiveRecord::Migration[5.2]
  def change
    create_table :laboratory_vaccines do |t|
      t.references :laboratory, foreign_key: true
      t.references :vaccine, foreign_key: true

      t.timestamps
    end
  end
end
