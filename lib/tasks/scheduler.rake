desc "This task is called by the Heroku scheduler add-on"

task :update_feed => :environment do
  puts "Updating feed..."
  FetchItemsJob.new.perform
  puts "done."
end

task :send_news => :environment do
  SendNewsJob.new.perform
end
