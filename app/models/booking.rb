class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :yacht
  validates :from_date, :to_date, :user_id, :yacht_id, presence: true
end
