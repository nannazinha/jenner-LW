class Appointment < ApplicationRecord
  belongs_to :laboratory
  belongs_to :vaccine
  belongs_to :member
  # validates :date, presence: true
end
