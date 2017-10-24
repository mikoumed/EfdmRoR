# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.create!(name: "RADAR")
Team.create!(name: "COM")

User.create!(name:  "mikou mohammed",
             email: "mikou@gmail.com",
             password:              "iab9mop",
             password_confirmation: "iab9mop",
             activated: true,
             team_id: 1,
             admin: true)



# users = User.order(:created_at).take(6)
# 50.times do
# content = Faker::Lorem.sentence(5)
# users.each { |user| user.events.create!(content: content) }
# end
