desc "Send a daily report on Slack"
task :send_daily_report => :environment do
  Shop.all.each do |shop|
    SlackService.new(notifiable: shop).call unless shop.slack_webhook_url.empty?
  end
end