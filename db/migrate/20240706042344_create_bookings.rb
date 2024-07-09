class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :from_date
      t.date :to_date

      t.timestamps
    end
  end
end
