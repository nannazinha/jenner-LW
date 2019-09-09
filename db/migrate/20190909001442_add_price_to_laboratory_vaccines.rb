class AddPriceToLaboratoryVaccines < ActiveRecord::Migration[5.2]
  def change
    add_monetize :laboratory_vaccines, :price, currency: { present: false }
  end
end
