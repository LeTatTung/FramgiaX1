# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create! name: "le tung", email: "letattungtb@gmail.com",
  password: "tung123", password_confirmation: "tung123", admin: true, sex: 0

50.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  sex = Random.rand(2)
  User.create! name: name, email: email, password: password,
    password_confirmation: password, sex: sex
end

Category.create!([{name: "Mountain"}, {name: "Cave"}, {name: "Sea"},
  {name: "Bay"}, {name: "Pagoda"}, {name: "Historical monuments"}])

users = User.all
user = users.first
user1 = User.find(2)
following = users[3..40]
followers = users[3..30]
following.each do |followed| 
  user.followers followed
  user1.followers followed
end

followers.each do |follower|
  follower.followers user
  follower.followers user1
end
