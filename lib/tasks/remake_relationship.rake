namespace :db do
  desc "Import Replationship"
  task relationships: [:environment] do
    (2..5).each do |n|
      Relationship.create! follower_id: 1, followed_id: n
      user = User.first
      profile = user.profile
      profile.followed_number = 1
      profile.save
    end
  end
end
