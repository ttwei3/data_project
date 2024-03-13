# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

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

