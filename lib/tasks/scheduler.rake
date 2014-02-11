desc "This task is called by the Heroku scheduler add-on"
task :post_to_yammer => :environment do
  Event.post_to_yammer
end