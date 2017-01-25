class ShopService::SlackResponder
  attr_reader :shop

  def initialize(shop)
    @shop = shop
  end

  def pretext
    "Daily Report - #{DateTime.current.strftime('%d/%m/%y')}"
  end

  def attachments
    {
      fallback: "Daily Report - #{DateTime.current.strftime('%d/%m/%y')}",
      color: "#7AB55C",
      mrkdwn_in: ["text", "fields"],
      fields: [
        {
          title: "Orders",
          value: shop.total_orders_between(today, tomorrow),
          short: true
        },
        {
          title: "Revenue",
          value: "#{shop.total_revenue_between(today, tomorrow)}€",
          short: true
        }
      ],
      ts: DateTime.current.to_i
    }
  end

  private

  def today
    DateTime.current.beginning_of_day
  end

  def tomorrow
    (DateTime.current + 1).beginning_of_day
  end
end