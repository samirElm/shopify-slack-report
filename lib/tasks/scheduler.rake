desc "Send a daily report on Slack"
task :send_daily_report => :environment do
  Shop.active.each do |shop|
    shop.with_shopify_session do
      SlackService::Notifier.new(notifiable: shop).notify
    end
  end
end
