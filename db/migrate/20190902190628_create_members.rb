class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :category
      t.references :user, foreign_key: true
      t.boolean :admin
      t.string :gender

      t.timestamps
    end
  end
end
