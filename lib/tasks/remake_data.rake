namespace :db do
  desc "Import data"
  task :remake_data do
    puts "**********Reset Database**********"
    Rake::Task["db:migrate:reset"].invoke
    puts "**********Create User**********"
    Rake::Task["db:users"].invoke
    puts "**********Create Category*********"
    Rake::Task["db:categories"].invoke
    puts "**********Create Image*********"
    Rake::Task["db:images"].invoke
    puts "**********Create Comment*********"
    Rake::Task["db:comments"].invoke
    puts "**********Create Like*********"
    Rake::Task["db:likes"].invoke
    puts "**********Create Relationship*********"
    Rake::Task["db:relationships"].invoke
  end
end
