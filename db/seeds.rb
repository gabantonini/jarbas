# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

puts 'Cleaning all users and services'
User.destroy_all
puts 'User and services cleaned'

# file = URI.open("https://source.unsplash.com/collection/9300133/#{rand(1..18)}")

puts "creating users"
20.times do 
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

puts 'Creating services for each user'

@users = User.all
@users.each do |user|
    rand(3..10).times do
        service = Service.new
        service.name = Faker::Verb.ing_form
        service.description = Faker::ChuckNorris.fact
        service.price = rand(1..400)
        service.time_to_answer = rand(1..7)
        service.disponibility = Faker::Date.between(from: Date.today, to: 8.days.from_now)
        service.user = user
        # service.photo.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
        service.save ? (puts 'service saved') : (puts "invalid service: #{service.errors.full_messages}")
    end
end

puts "Creating bookings"

#@users = User.all
@users.each do |user|
    rand(1..5).times do
        booking = Booking.new
        booking.service_id = rand(1..100)
        booking.user = user
        booking.date = Faker::Date.between(from: Date.today, to: 8.days.from_now)

        # Não sei quais vão ser o status ainda, depois a gente arruma os possiveis
        booking.status = ["Confirmado", "Aguardando confirmação", "Declinado"].sample
        booking.save ? (puts 'booking saved') : (puts "invalid booking: #{service.errors.full_messages}")

    end
end

puts 'Users, services and bookings created'
