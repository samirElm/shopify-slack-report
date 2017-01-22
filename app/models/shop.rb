class Shop < ActiveRecord::Base
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  def self.current
    find_by_shopify_domain(ShopifyAPI::Shop.current.domain)
  end
end
