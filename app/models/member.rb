class Member < ApplicationRecord
  belongs_to :user
  has_many :member_vaccines, dependent: :destroy
  has_many :vaccines, through: :member_vaccines
  accepts_nested_attributes_for :member_vaccines, allow_destroy: true
end
