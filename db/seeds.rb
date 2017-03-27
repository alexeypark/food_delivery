# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create!(email: 'admin@example.com', password: 'password', role: 'admin', name: 'Admin', address: 'Lorem Ipsum', phone: '1234567')
user = User.create!(email: 'user@example.com', password: 'password', role: 'none', name: 'User', address: 'Lorem Ipsum', phone: '1234567')
restaurant = Place.create(name: 'Restaurant', description: 'Lorem Ipsum')
dish = Dish.create(name: 'Dish', description: 'Lorem Ipsum', price: 100, place_id: restaurant)
Place.create([{name: Faker::Food.spice, description: Faker::Lorem.paragraph(2, false, 4), image: File.open(Dir.glob(File.join(Rails.root,'app', 'assets', 'images', 'sampleimages', '*')).sample)},
              {name: Faker::Food.spice, description: Faker::Lorem.paragraph(2, false, 4), image: File.open(Dir.glob(File.join(Rails.root,'app', 'assets', 'images', 'sampleimages', '*')).sample)},
              {name: Faker::Food.spice, description: Faker::Lorem.paragraph(2, false, 4), image: File.open(Dir.glob(File.join(Rails.root,'app', 'assets', 'images', 'sampleimages', '*')).sample)},
              {name: Faker::Food.spice, description: Faker::Lorem.paragraph(2, false, 4), image: File.open(Dir.glob(File.join(Rails.root,'app', 'assets', 'images', 'sampleimages', '*')).sample)},
              {name: Faker::Food.spice, description: Faker::Lorem.paragraph(2, false, 4), image: File.open(Dir.glob(File.join(Rails.root,'app', 'assets', 'images', 'sampleimages', '*')).sample)},
              {name: Faker::Food.spice, description: Faker::Lorem.paragraph(2, false, 4), image: File.open(Dir.glob(File.join(Rails.root,'app', 'assets', 'images', 'sampleimages', '*')).sample)},
              {name: Faker::Food.spice, description: Faker::Lorem.paragraph(2, false, 4), image: File.open(Dir.glob(File.join(Rails.root,'app', 'assets', 'images', 'sampleimages', '*')).sample)},
              {name: Faker::Food.spice, description: Faker::Lorem.paragraph(2, false, 4), image: File.open(Dir.glob(File.join(Rails.root,'app', 'assets', 'images', 'sampleimages', '*')).sample)}
             ])

80.times do
  Dish.create(name: Faker::Food.ingredient, description: Faker::Lorem.paragraph(2, false, 4), price: rand(1..500), place_id: rand(1..8))
end


