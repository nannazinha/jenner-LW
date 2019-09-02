class Laboratory < ApplicationRecord
  has_many :laboratory_vaccines, dependent: :destroy
  has_many :vaccines, through: :laboratory_vaccines
end
