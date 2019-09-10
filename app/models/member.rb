class Member < ApplicationRecord
  belongs_to :user
  has_many :member_vaccines, dependent: :destroy
  has_many :vaccines, through: :member_vaccines
  has_many :appointments, dependent: :destroy
  accepts_nested_attributes_for :member_vaccines, allow_destroy: true
  mount_uploader :photo, PhotoUploader
  has_many :orders
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :category, presence: true
  validates :gender, presence: true
end
