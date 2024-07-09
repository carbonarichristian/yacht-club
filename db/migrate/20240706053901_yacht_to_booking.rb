class YachtToBooking < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :yacht, foreign_key: true
  end
end
