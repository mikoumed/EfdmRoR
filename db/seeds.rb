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

50.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    team_id = "1"
    User.create!(name:  name,
                email: email,
                password:              password,
                team_id: team_id,
                password_confirmation: password)
end
50.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstuto.org"
    password = "password"
    team_id = "2"
    User.create!(name:  name,
                email: email,
                password:              password,
                team_id: team_id,
                password_confirmation: password)
end

users = User.order(:created_at).take(1)

50.times do
    content = Faker::Lorem.sentence(5)
    tid = '1'
    users.each { |user| user.events.create!(content: content, team_id: tid) }
end

50.times do
    tid = '1'
    remHS = Faker::Lorem.sentence(12)
    users.each { |user| user.intlines.create!(remHS: remHS, team_id: tid)}
end

50.times do
    tid = '1'  
    remHS = Faker::Lorem.sentence(12)
    users.each { |user| user.intequipments.create!(remHS: remHS, team_id: tid)}
end



# users = User.order(:created_at).take(6)
# 50.times do
# content = Faker::Lorem.sentence(5)
# users.each { |user| user.events.create!(content: content) }
# end
