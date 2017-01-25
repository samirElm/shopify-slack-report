class ShopService::Report
  def total_orders_between(date_min, date_max)
    all_orders_between(date_min, date_max).count
  end

  def total_revenue_between(date_min, date_max)
    all_orders_between(date_min, date_max).inject(0) do |sum, order|
      sum + order.total_price.to_f
    end
  end

  private

  def all_orders_between(date_min, date_max)
    ShopifyAPI::Order.find(:all, created_at_min: date_min, created_at_max: date_max)
  end
end