namespace :db do
  desc "Import Like"
  task likes: [:environment] do
    Image.all.each do |image|
      FeedBack.create! user_id: 1, image_id: image.id, feed_back_type: "like"
      FeedBack.create! user_id: 2, image_id: image.id, feed_back_type: "like"
      FeedBack.create! user_id: 3, image_id: image.id, feed_back_type: "like"
      FeedBack.create! user_id: 4, image_id: image.id, feed_back_type: "like"
      FeedBack.create! user_id: 5, image_id: image.id, feed_back_type: "like"
      image.like_number = 5
      image.save
    end
  end
end
