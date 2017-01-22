class SlackService
  attr_reader :notifier

  def initialize(args = {})
    @notifier = Slack::Notifier.new args[:shop].slack_webhook_url
  end

  def send_report
    notifier.ping "Hey"
  end
end