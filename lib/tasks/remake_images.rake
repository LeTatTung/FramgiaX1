namespace :db do
  desc "Import Image"
  task images: [:environment] do
    (1..5).each do |index|
      image = Image.new user_id: 1, category_id: 1, address: "Framgia Viet Nam",
        description: "Cho nay dep lam, ngay nao toi cung ghe qua.
        canh sac thi tuyet dep, cong cu day du
        nhat dinh hay ghe qua nhe !",
        image: Rails.root.join("app/assets/images/portfolio-#{index}.jpg").open
      image.save!
    end
    (6..7).each do |index|
      image = Image.new user_id: 2, category_id: 1, address: "Viet Nam",
        description: "Cho nay dep lam, ngay nao toi cung ghe qua.
        canh sac thi tuyet dep, cong cu day du
        nhat dinh hay ghe qua nhe !",
        image: Rails.root.join("app/assets/images/portfolio-#{index}.jpg").open
      image.save!
    end
  end
end
