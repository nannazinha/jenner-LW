class MemberVaccine < ApplicationRecord
  belongs_to :member
  belongs_to :vaccine
end
