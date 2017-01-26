desc "Send a daily report on Slack"
task :send_daily_report => :environment do
  Shop.all.each do |shop|
    shop.with_shopify_session do
      SlackService.new(notifiable: shop).call
    end
  end
end