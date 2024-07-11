# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Yacht.destroy_all
User.destroy_all
user = User.create!(email:"pammmm@kool.com", password:"123456")

yachts = [
  { name: 'Sea Breeze', model: 'Sunseeker Predator 74', price: 4500.00, user: user },
  { name: 'Ocean Escape', model: 'Azimut 66 Flybridge', price: 5000.00, user: user },
  { name: 'Wave Rider', model: 'Princess V65', price: 4700.00, user: user},
  { name: 'Luxury Cruiser', model: 'Ferretti 720', price: 5500.00, user: user},
  { name: 'Dream Catcher', model: 'Pershing 8X', price: 5300.00, user: user},
  { name: 'Nautical Adventure', model: 'Sanlorenzo SL86', price: 6000.00, user: user},
]
yachts.each do |info|
  Yacht.create!(info)
end
