class LaboratoryVaccine < ApplicationRecord
  belongs_to :laboratory
  belongs_to :vaccine
  monetize :price_cents
end
