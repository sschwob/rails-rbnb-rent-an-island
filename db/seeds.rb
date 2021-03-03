# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clean DB Bookings"
Booking.destroy_all
puts "Clean DB Islands"
Island.destroy_all

puts "Create islands"
Island.create!(name: "Ambergris Caye", country: "BZ", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                latitude: "18° 00′ 50″ N", longitude: "87° 55′ 52″ O", price_per_day: 15000, area: 64, user_id: 1 )

Island.create!(name: "Bora Bora", country: "FR", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  latitude: "16° 29′ 40″ S", longitude: "151° 44′ 11″ O", price_per_day: 17500, area: 38, user_id: 1 )

Island.create!(name: "Santorin", country: "GR", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  latitude: "36° 23′ 17″ N", longitude: "25° 27′ 35″ E", price_per_day: 25500, area: 76, user_id: 1 )

Island.create!(name: "Nosy be", country: "MG", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  latitude: "13° 20′ 00″ S", longitude: "48° 15′ 00″ E", price_per_day: 57400, area: 321, user_id: 1 )

Island.create!(name: "Saint John", country: "US", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  latitude: "18° 20′ N", longitude: "64° 44′ O", price_per_day: 35400, area: 51, user_id: 1 )

Island.create!(name: "Capri", country: "IT", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  latitude: "40° 33′ 00″ N", longitude: "14° 14′ 00″ E", price_per_day: 10250, area: 10, user_id: 1 )

puts "#{Island.all.count} islands created"
