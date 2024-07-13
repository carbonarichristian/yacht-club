class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :yacht
  validates :from_date, presence: true
  validates :to_date, presence: true
end
