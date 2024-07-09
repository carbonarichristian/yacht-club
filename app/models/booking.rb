class Booking < ApplicationRecord
  belongs_to :users
  belongs_to :yachts
  validates :from_date, presence: true
  validates :to_date, presence: true
end
