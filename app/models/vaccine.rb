class Vaccine < ApplicationRecord
  has_many :member_vaccines
  has_many :members, through: :member_vaccines
  has_many :laboratory_vaccines
  has_many :laboratories, through: :laboratory_vaccines
  monetize :price_cents
end
