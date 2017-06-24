namespace :db do
  desc "Import User"
  task users: [:environment] do
    10.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@gmail.com"
      password = "123456"
      user = User.create! name: name, email: email, password: password,
        password_confirmation: password
      Profile.create! user_id: user.id
    end
    user = User.create! name: "le tung",
      email: "letattungtb@gmail.com", password: "tung123"
    Profile.create! user_id: user.id
  end
end
