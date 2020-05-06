# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

puts "creating users"
20.times do 
    # file = URI.open("https://source.unsplash.com/collection/9300133/#{rand(1..18)}")
    user = User.new()
    user.first_name = Faker::Name.first_name  
    user.last_name =  Faker::Name.last_name 
    user.address = Faker::Address.street_name 
    user.zip_code = "12345-678"
    user.email = Faker::Internet.email
    # user.photo.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
    user.password = "123456"    
    user.save ? (puts "user saved") : (puts "invalid user: #{user.errors.full_messages}")
    puts "saved"

end