ShopifyApp.configure do |config|
  config.api_key = ENV['SHOPIFY_API_KEY']
  config.secret = ENV['SHOPIFY_SECRET']
  config.scope = "read_orders"
  config.embedded_app = true
end
