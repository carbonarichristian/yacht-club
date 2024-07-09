class User < ApplicationRecord
  has_many :yachts
  has_many :bookings
end
