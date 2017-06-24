namespace :db do
  desc "Import Comment"
  task comments: [:environment] do
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
  end
end
