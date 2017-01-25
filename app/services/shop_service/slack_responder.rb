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
          value: "TODO",
          short: true
        },
        {
          title: "Revenue",
          value: "TODO",
          short: true
        }
      ],
      ts: DateTime.current.to_i
    }
  end
end