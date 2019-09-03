class Laboratory < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :laboratory_vaccines, dependent: :destroy
  has_many :vaccines, through: :laboratory_vaccines
end
