class Member < ApplicationRecord
  belongs_to :user
  has_many :member_vaccines, dependent: :destroy
  has_many :vaccines, through: :member_vaccines
end
