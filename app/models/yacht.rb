class Yacht < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :name, presence: true
  validates :model, presence: true
  validates :price, presence: true
end
