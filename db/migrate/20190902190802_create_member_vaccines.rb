class CreateMemberVaccines < ActiveRecord::Migration[5.2]
  def change
    create_table :member_vaccines do |t|
      t.references :member, foreign_key: true
      t.references :vaccine, foreign_key: true
      t.date :vaccine_date
      t.boolean :vaccinated

      t.timestamps
    end
  end
end
