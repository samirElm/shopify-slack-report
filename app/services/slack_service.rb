class SlackService
  attr_reader :notifier, :notifiable

  def initialize(args = {})
    @notifiable = args[:notifiable]
    @notifier = Slack::Notifier.new notifiable.slack_webhook_url
  end

  def call
    notifier.ping notifiable.pretext, attachments: [notifiable.attachments]
  end
end