namespace :db do
  desc "Import Category"
  task categories: [:environment] do
    ["Mountain", "Cave", "Sea", "Bay", "Pagoda", "Historical monuments"].each do |category|
      Category.create! name: category
    end
  end
end
