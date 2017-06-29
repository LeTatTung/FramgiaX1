# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create! name: "Le Tat Tung", email: "tunglt@gmail.com",
  password: "tunglt", password_confirmation: "tunglt", admin: true, sex: 0

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123456"
  user = User.create! name: name, email: email, password: password,
    password_confirmation: password
  Profile.create! user_id: user.id
end

Category.create!([{name: "Mountain"}, {name: "Cave"}, {name: "Sea"},
  {name: "Bay"}, {name: "Pagoda"}, {name: "Historical monuments"}])


users = User.all
user = users.first
user1 = User.find(2)
following = users[3..15]
followers = users[3..18]
following.each do |followed| 
  user.follow followed
  user1.follow followed
end

followers.each do |follower|
  follower.follow user
  follower.follow user1
end

Image.all.each do |image|
  FeedBack.create! user_id: 1, image_id: image.id, feed_back_type: "like"
  FeedBack.create! user_id: 2, image_id: image.id, feed_back_type: "like"
  FeedBack.create! user_id: 3, image_id: image.id, feed_back_type: "like"
  FeedBack.create! user_id: 4, image_id: image.id, feed_back_type: "like"
  FeedBack.create! user_id: 5, image_id: image.id, feed_back_type: "like"
  image.like_number = 5
  image.save
end

Image.all.each do |image|
  comment = Comment.create! user_id: 1, image_id: image.id,
    content: "Anh dep that day. Ban la nguoi chup anh kha chuyen nghiep day!"
  Comment.create! user_id: 2, image_id: image.id,
    content: "Anh dep that day. Ban la nguoi chup anh kha chuyen nghiep day!"
  Comment.create! user_id: 3, image_id: image.id,
    content: "Anh dep that day. Ban la nguoi chup anh kha chuyen nghiep day!"
  Comment.create! user_id: 4, image_id: image.id,
    content: "Anh dep that day. Ban la nguoi chup anh kha chuyen nghiep day!"
  c1 = Comment.create! user_id: 3, image_id: image.id, parent_id: comment.id,
    content: "Dung vay.Toi hoc chup anh cung duoc 5 nam roi"
  Comment.create! user_id: 4, image_id: image.id, parent_id: comment.id,
    content: "Dung vay.Toi hoc chup anh cung duoc 5 nam roi"
  Comment.create! user_id: 5, image_id: image.id, parent_id: comment.id,
    content: "Dung vay.Toi hoc chup anh cung duoc 5 nam roi"
  Comment.create! user_id: 2, image_id: image.id, parent_id: comment.id,
    content: "Dung vay.Toi hoc chup anh cung duoc 5 nam roi", reply_id: c1.id
  image.comment_number = 8
  image.save
end
