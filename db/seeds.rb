# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

puts 'Cleaning all users, service categories and services'
Booking.destroy_all
User.destroy_all

ServiceCategory.destroy_all
puts 'User, service categories, services, bookings and reviews cleaned'
puts "Booking: #{Booking.count} Users: #{User.count} Reviews: #{Review.count} Services: #{Service.count}"

puts "creating users"
10.times do 
    # puts 'Opening photo for user'
    # Too slow to fetch images but it is working!
    # file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
    user = User.new()
    user.first_name = Faker::Name.first_name  
    user.last_name =  Faker::Name.last_name 
    user.address = Faker::Address.street_name 
    user.zip_code = "12345-678"
    user.email = Faker::Internet.email
    # puts 'Adding photo to user'
    # user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')
    user.password = "123456"    
    user.save ? (puts "user saved") : (puts "invalid user: #{user.errors.full_messages}")
    puts "saved"

end

puts 'Creating Service Categories'

# Definir depois as categorias de serviços que queremos
categories = ["Assistência Técnica", "Aulas", "Autos", "Consultoria",
    "Design e Tecnologia", "Eventos", "Moda e Beleza", "Reformas", "Saúde", "Serviços Domésticos"]
categories.each do |category|
    ServiceCategory.create(name: category)
end

puts 'Service categories created'

puts 'Creating services for each user'

@users = User.all
@categories = ServiceCategory.all

@users.each do |user|
    rand(2..10).times do
        # Slow but working
        # puts 'Opening photo for service'
        # file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
        service = Service.new
        service.name = Faker::Verb.ing_form
        service.description = Faker::ChuckNorris.fact
        service.price = rand(1..400)
        service.time_to_answer = rand(1..7)
        service.disponibility = Faker::Date.between(from: Date.today, to: 8.days.from_now)
        service.user = user
        service.service_category = @categories.sample
        # puts 'Adding photo to service'
        # service.photo.attach(io: file, filename: 'service.png', content_type: 'image/png')
        service.save ? (puts 'service saved') : (puts "invalid service: #{service.errors.full_messages}")
    end
end


puts "Creating bookings"

@services = Service.all

@users.each do |user|
    rand(1..5).times do
        booking = Booking.new
        booking.service = @services.sample
        booking.user = user
        booking.date = Faker::Date.between(from: Date.today, to: 8.days.from_now)

        # Não sei quais vão ser o status ainda, depois a gente arruma os possiveis
        booking.status = ["Confirmado", "Aguardando confirmação", "Declinado"].sample
        booking.save ? (puts 'booking saved') : (puts "invalid booking: #{booking.errors.full_messages}")
    end
end

puts "Creating reviews"

Booking.all.each do |booking|
    content = Faker::Restaurant.review
    rating = rand(0..5)
    review = Review.new(content: content, rating: rating, booking: booking)
    
    puts "invalid review: #{booking.errors.full_messages}" unless review.valid?

    review.save ? (puts 'review saved') : (puts "invalid review: #{booking.errors.full_messages}")
end


puts "#{User.count } Users have been created"
puts "#{Service.count } Services have been created"
puts "#{Booking.count } Bookings have been created"
puts "#{Review.count} reviews created"
puts "#{ServiceCategory.count} Service Categories have been created"
