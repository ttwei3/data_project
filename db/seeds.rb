# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# avoid repeating data
Owner.destroy_all
Breed.destroy_all
Dog.destroy_all

# import owners data from csv file
require 'csv'

CSV.foreach(Rails.root.join('owner.csv'), headers: true) do |row|
  Owner.create!(
    owner_name: row['owner_name'],
    owner_address: row['owner_address'],
    owner_city: row['owner_city'],
    owner_province: row['owner_province'],
    owner_postal_code: row['owner_postal_code'],
  )
rescue ActiveRecord::RecordInvalid => e
  puts "Record not saved: #{e.message}"
end

puts "Imported #{Owner.count} owners"

# import breeds data by using api
Rake::Task['api:fetch_breeds_with_images'].invoke
puts "There are #{Breed.count} breeds in the database."

# use faker to generate dogs data
200.times do
  Dog.create!(
    dog_name: Faker::Name.first_name,
    dog_gender: Faker::Gender.short_binary_type,
    dog_age: Faker::Number.between(from: 1, to: 10),
    fav_food: Faker::Food.vegetables,
    breed_id: Breed.pluck(:id).sample, # randomly pick a breed_id
    owner_id: [nil, Owner.pluck(:id).sample].sample # randomly pick a owner_id or nil
  )
end
puts "Successfully"