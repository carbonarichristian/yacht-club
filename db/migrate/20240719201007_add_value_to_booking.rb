class AddValueToBooking < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :value, :float
  end
end
