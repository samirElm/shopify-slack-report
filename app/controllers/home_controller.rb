class HomeController < ShopifyApp::AuthenticatedController

  def index
    # webhook_url = Shop.current.slack_webhook_url
    # require 'slack-notifier'
    # notifier = Slack::Notifier.new webhook_url
    # notifier.ping "Hello World"

    # Shop Edit

    @shop = Shop.current
    @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
  end
end
