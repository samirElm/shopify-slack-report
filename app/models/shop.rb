class Shop < ActiveRecord::Base
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  def self.current
    find_by_shopify_domain(ShopifyAPI::Shop.current.domain)
  end

  def self.active
    Shop.all
  end

  def pretext
    ShopService::SlackResponder.new(self).pretext
  end

  def attachments
    ShopService::SlackResponder.new(self).attachments
  end

  def total_orders_between(date_min, date_max)
    ShopService::Report.new.total_orders_between(date_min, date_max)
  end

  def total_revenue_between(date_min, date_max)
    ShopService::Report.new.total_revenue_between(date_min, date_max)
  end
end
