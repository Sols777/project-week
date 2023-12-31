require "open-uri"
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Venue.destroy_all
User.destroy_all
# Create a test user
user = User.create!(email: "test@example.com", password: "password", first_name: "Test", last_name: "User")

# Create a test venue belonging to that user
#venue = Venue.create!(name: "Test Venue", user_id: user.id, address: "Paris ,France", description: "This is a test venue", capacity: 100, bustability: 85)
venue = Venue.create!(name: "another text", user_id: user.id, address: "Lisbon, Portugal", description: "This is a test venue", capacity: 100, bustability: 85)
venue = Venue.create!(name: "dif test", user_id: user.id, address: "London , England", description: "This is a test venue", capacity: 100, bustability: 85)

# # Create an accepted test booking for demo data
# booking = Booking.find_or_create_by!(venue: venue, user: user) do |booking|
#   booking.date = Date.today
#   booking.status = "accepted"
# end
file = URI.open("https://res.cloudinary.com/dcy5ynb6q/image/upload/v1700313527/production/6a323ggq76b5lry8dy6rsscskli8.jpg")
venue = Venue.new(name: "Test Venue", user_id: user.id, address: "Paris ,France", description: "This is a test venue", capacity: 100, bustability: 85)
venue.photo.attach(io: file, filename: "test.jpg", content_type: "image/jpg")
venue.save
