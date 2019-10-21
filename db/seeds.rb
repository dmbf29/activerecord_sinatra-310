require 'faker'

30.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    rating: rand(0..5)
  )
end
