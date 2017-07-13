class Passenger < ApplicationRecord
  belongs_to :booking, optional: true

  validates :name, presence: true
  validates :email, presence: true
end
